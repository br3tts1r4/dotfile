#!/usr/bin/env bash
# Restart Waybar, waiting for the old process to exit so the layer surface is free.

set -euo pipefail

killall -q waybar || true

while pgrep -x waybar >/dev/null; do
	sleep 0.1
done

waybar &
