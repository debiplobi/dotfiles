#!/usr/bin/env bash
echo detect | sudo tee /sys/class/drm/card*-HDMI-A-*/status
