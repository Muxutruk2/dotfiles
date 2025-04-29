#!/usr/bin/env bash

filename="$XDG_PICTURES_DIR/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"

area=$(slurp)

[ -n "$area" ] && grim -g "$area" "$filename" && notify-send "Screenshot saved" "$filename"
