#!/bin/sh
swayidle -w \
    timeout 500 'waylock -init-color 0x2e2e2e' \
    timeout 600 'niri msg action power-off-monitors' \
        resume 'niri msg action power-on-monitors' \
    timeout 1800 'loginctl suspend' \
    before-sleep 'pgrep -x waylock || waylock -init-color 0x2e2e2e'
