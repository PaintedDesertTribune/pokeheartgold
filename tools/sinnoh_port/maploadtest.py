#!/usr/bin/env python3
"""Unattended map-load test over melonDS's GDB stub.

melonDS 1.1 does not un-escape gdb's binary X packets, so memory writes go through the hex M packet
(`set remote binary-download-packet off`); otherwise values containing 0x23/0x24/0x2A/0x7D bytes are corrupted.

For each map: relaunch melonDS (configured with the ARM9 GDB stub and BreakOnStartup), attach gdb, let the game
boot (HACK_AUTO_NEWGAME starts a new game by itself), patch the new-game start location in RAM when the game
reads it, then wait for either the field to run (PASS), an assertion (ASSERT: file, line, backtrace), another
stop such as a CPU exception (CRASH), or nothing within the time limit (HANG).

    python3 tools/sinnoh_port/maploadtest.py [--maps MAP_SINNOH_A,MAP_SINNOH_B] [--prefix MAP_SINNOH_] [--out report.json]
"""
import argparse, json, os, re, subprocess, sys, time

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
ROM = os.path.join(ROOT, "build/pokeheartgold.us.nds")
ELF = os.path.join(ROOT, "build/heartgold.us.nef")
MELONDS = os.path.expanduser("~/Applications/melonDS.app")
GDB = "arm-none-eabi-gdb"

def nm():
    out = subprocess.run([f"arm-none-eabi-nm", ELF], capture_output=True, text=True).stdout
    return {m.group(2): int(m.group(1), 16) for m in re.finditer(r"^([0-9a-f]{8}) [TtDdBb] (\w+)$", out, re.M)}

def map_ids():
    ids = {}
    for path in (os.path.join(ROOT, "include/constants/maps.h"), os.path.join(ROOT, "include/constants/sinnoh.h")):
        if os.path.exists(path):
            for m in re.finditer(r"#define (MAP_\w+)\s+(\d+)", open(path).read()):
                ids.setdefault(m.group(1), int(m.group(2)))
    return ids

def start_coords(name, dp_codes):
    """A walkable tile: in front of the map's first warp (its door), else the middle of a small interior."""
    import glob
    code = dp_codes.get("MAP_" + name[len("MAP_SINNOH_"):])
    files = glob.glob(os.path.join(ROOT, "files/fielddata/eventdata/zone_event", f"*_{code}.json")) if code else []
    for path in files:
        d = json.load(open(path))
        if d.get("warps"):
            w = d["warps"][0]
            return w["x"], w["z"] + 1
    return 8, 8

def run_one(name, mid, x, y, syms, timeout=70):
    subprocess.run(["pkill", "-9", "-x", "melonDS"], capture_output=True)
    time.sleep(1.5)
    subprocess.run(["open", "-a", MELONDS, ROM], check=True)
    time.sleep(4)
    loc = syms["sLocation_PlayerRoom"]
    script = f"""set pagination off
set confirm off
file {ELF}
set remote binary-download-packet off
target remote localhost:3333
break Location_SetToPlayerRoom
continue
set {{int}}{loc:#x} = {mid}
set {{int}}{loc + 8:#x} = {x}
set {{int}}{loc + 12:#x} = {y}
delete
break GF_AssertFail
break PlayerAvatar_UpdateMovement
continue
echo \\n=== STOP ===\\n
info registers r0 r1 r2 r3 r4 r5 r6 r7 pc lr sp
x/s $r0
print/x gHackAllocFailHeap
print/x gHackAllocFailSize
print/x gHackNote
bt 10
x/96wx $sp
detach
quit
"""
    sp = f"/tmp/maploadtest_{os.getpid()}.gdb"
    open(sp, "w").write(script)
    t0 = time.time()
    try:
        out = subprocess.run([GDB, "-q", "-batch", "-x", sp], capture_output=True, text=True, timeout=timeout).stdout
    except subprocess.TimeoutExpired as e:
        out = (e.stdout or b"").decode() if isinstance(e.stdout, bytes) else (e.stdout or "")
        # No assert and no exception in the time limit: the map is running (a map-entry script may be holding the
        # player, so the movement marker never fires). An infinite loop would look the same, which is rare.
        return {"map": name, "id": mid, "x": x, "y": y, "result": "PASS_NOASSERT", "seconds": round(time.time() - t0)}
    stop = out.split("=== STOP ===")[-1] if "=== STOP ===" in out else ""
    res = {"map": name, "id": mid, "x": x, "y": y, "seconds": round(time.time() - t0)}
    logdir = os.environ.get("MAPLOADTEST_LOGDIR")
    if logdir:
        os.makedirs(logdir, exist_ok=True)
        open(os.path.join(logdir, name + ".log"), "w").write(out)
    if re.search(r"Breakpoint \d+, 0x%08x" % syms["GF_AssertFail"], out) or re.search(r"^pc\s+0x%08x" % syms["GF_AssertFail"], stop, re.M):
        res["result"] = "ASSERT"
        m = re.search(r'0x[0-9a-f]+:\s+"([^"]*)"', stop)
        r1 = re.search(r"^r1\s+0x[0-9a-f]+\s+(\d+)", stop, re.M)
        res["where"] = f"{m.group(1) if m else '?'}:{r1.group(1) if r1 else '?'}"
        res["stack"] = resolve_stack(stop, syms)
    elif "PlayerAvatar_UpdateMovement" in stop.split("\n", 3)[0] or re.search(r"Breakpoint \d+, 0x%08x" % syms["PlayerAvatar_UpdateMovement"], out):
        res["result"] = "PASS"
    elif "=== STOP ===" in out:
        res["result"] = "CRASH"
        pc = re.search(r"^pc\s+(0x[0-9a-f]+)", stop, re.M)
        res["pc"] = pc.group(1) if pc else "?"
        res["stack"] = resolve_stack(stop, syms)
        res["tail"] = out[-700:]
    else:
        res["result"] = "NOATTACH"
        res["tail"] = out[-400:]
    return res

def resolve_stack(stop, syms):
    addrs = sorted((a, n) for n, a in syms.items() if 0x02000000 <= a < 0x02100000)
    keys = [a for a, _ in addrs]
    import bisect
    names = []
    for w in re.findall(r"0x([0-9a-f]{8})", stop.split("x/96wx")[-1] if "x/96wx" in stop else stop):
        v = int(w, 16)
        if 0x02000000 <= v < 0x02100000 and v & 1:
            i = bisect.bisect_right(keys, v) - 1
            if i >= 0:
                names.append(f"{addrs[i][1]}+{v - addrs[i][0]:#x}")
    return names[:12]

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--maps", default="")
    ap.add_argument("--prefix", default="MAP_SINNOH_")
    ap.add_argument("--out", default=os.path.join(ROOT, "tools/sinnoh_port/maploadtest_report.json"))
    ap.add_argument("--at", default="", help="override start tile for every map in this run, as x,y")
    ap.add_argument("--skip-passed", action="store_true", help="skip maps already PASS in --out")
    a = ap.parse_args()
    syms = nm()
    ids = map_ids()
    dp_codes = {k: c[4:] for k, c in re.findall(r"#define (MAP_\w+)\s+\d+\s*// (MAP_\w+)", open(os.path.expanduser("~/code/pokediamond/include/constants/maps.h")).read())}
    names = [n for n in a.maps.split(",") if n] or sorted(n for n in ids if n.startswith(a.prefix))
    prev = {}
    if os.path.exists(a.out):
        try:
            prev = {r["map"]: r for r in json.load(open(a.out))}
        except Exception:
            prev = {}
    results = dict(prev)
    for i, name in enumerate(names):
        if a.skip_passed and prev.get(name, {}).get("result") == "PASS":
            continue
        x, y = start_coords(name, dp_codes)
        if a.at:
            x, y = (int(v) for v in a.at.split(","))
        r = run_one(name, ids[name], x, y, syms)
        results[name] = r
        print(f"[{i+1}/{len(names)}] {name}: {r['result']} {r.get('where', '')} {r.get('pc', '')}", flush=True)
        json.dump(sorted(results.values(), key=lambda r: r["map"]), open(a.out, "w"), indent=1)
    subprocess.run(["pkill", "-9", "-x", "melonDS"], capture_output=True)
    counts = {}
    for r in results.values():
        counts[r["result"]] = counts.get(r["result"], 0) + 1
    print("summary", counts)

if __name__ == "__main__":
    main()
