#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$repo_root"

make clean >/dev/null
make >/dev/null

output="$(./bin/report_buffer_lab samples/orders.txt 2>&1 || true)"
expected="$(cat <<'EOF'
report | rows=4 | longest=14
01 | Widget         | qty= 3 | unit= 19 | total= 57 | cat=hardware
02 | Cable Bundle   | qty=12 | unit=  4 | total= 48 | cat=accessory
03 | Precision Gear | qty= 2 | unit=125 | total=250 | cat=hardware
04 | Notebook       | qty= 5 | unit=  7 | total= 35 | cat=office
summary | grand_total=390 | max_total=250 | reads=4 | writes=1
EOF
)"

echo "$output"

if [[ "$output" != "$expected" ]]; then
	echo "visible test: output mismatch" >&2
	diff -u <(printf "%s\n" "$expected") <(printf "%s\n" "$output") || true
	exit 1
fi

echo "visible test: passed"
