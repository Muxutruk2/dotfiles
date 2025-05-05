#!/usr/bin/env bash

filename="$XDG_PICTURES_DIR/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png"
area=$(slurp)

if [ -n "$area" ]; then
    grim -g "$area" "$filename" &&
        wl-copy <"$filename" &&
        notify-send "Screenshot copied to clipboard" "$filename"
fi
