# #!/bin/sh
# swayidle -w \
#     timeout 500 'waylock -init-color 0x2e2e2e' \
#     timeout 600 'hyprctl dispatch dpms off' \
#         resume 'hyprctl dispatch dpms on' \
#     timeout 1800 'systemctl suspend' \
#     before-sleep 'pgrep -x waylock || waylock -init-color 0x2e2e2e'
#
#!/bin/sh
swayidle -w \
    timeout 500 'swaylock -f -c 2e2e2e' \
    timeout 600 'hyprctl dispatch dpms off' \
        resume 'hyprctl dispatch dpms on' \
    timeout 1800 'systemctl suspend' \
    before-sleep 'swaylock -f -c 2e2e2e'
