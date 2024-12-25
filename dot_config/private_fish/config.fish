if status is-interactive
    set EDITOR /usr/bin/nvim
    set -U fish_greeting
end

status is-interactive; and begin
    set fish_tmux_autostart true
end

theme_gruvbox dark

set -g bg 1c/1f/26

fish_hybrid_key_bindings # Vim mod with default fish bindings

set XDG_PICTURES_DIR $HOME/Pictures
set -x QT_QPA_PLATFORMTHEME qt5ct
set -U async_prompt_functions fish_prompt

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias confalacritty="$EDITOR ~/.local/share/chezmoi/dot_config/alacritty"
alias confhypr="$EDITOR ~/.local/share/chezmoi/dot_config/hypr"
alias confnvim="$EDITOR ~/.local/share/chezmoi/dot_config/nvim"
alias conffish="$EDITOR ~/.local/share/chezmoi/dot_config/private_fish"
alias confwaybar="$EDITOR ~/.local/share/chezmoi/dot_config/waybar/config.jsonc"
alias confwaybarcss="$EDITOR ~/.local/share/chezmoi/dot_config/waybar/style.css"
alias conftmux="$EDITOR ~/.local/share/chezmoi/dot_tmux.conf"

function chezcommit
    git -C ~/.local/share/chezmoi add dot_config
    git -C ~/.local/share/chezmoi commit
    git -C ~/.local/share/chezmoi push
end

function cheztest
    chezmoi diff
    chezmoi apply
end

alias py="python3"
alias python="python"
