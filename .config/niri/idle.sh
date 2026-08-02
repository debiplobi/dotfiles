#!/bin/sh
swayidle -w \
    timeout 300 'swaylock -f -c 2e2e2e' \
    timeout 400 'niri msg action power-off-monitors' \
        resume 'niri msg action power-on-monitors' \
    timeout 1800 'loginctl suspend' \
    before-sleep 'swaylock -f -c 2e2e2e'
