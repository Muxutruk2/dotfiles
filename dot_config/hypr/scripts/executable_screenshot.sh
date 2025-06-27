#!/usr/bin/env bash

export PATH="$HOME/.nix-profile/bin:/run/current-system/sw/bin:$PATH"

XDG_PICTURES_DIR="${XDG_PICTURES_DIR:-$HOME/Pictures}"

filename="$XDG_PICTURES_DIR/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png"
area=$(slurp)

if [ -n "$area" ]; then
    grim -g "$area" "$filename" &&
        wl-copy <"$filename" &&
        notify-send "Screenshot copied to clipboard" "$filename"
fi
