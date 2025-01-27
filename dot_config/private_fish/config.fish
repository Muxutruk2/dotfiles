if status is-interactive
    set EDITOR /usr/bin/nvim
end

set -g bg 1c/1f/26
set -g TERM xterm-256color

fish_hybrid_key_bindings # Vim mod with default fish bindings

# Add git to tide prompt
set --universal tide_git_indicator detailed

if type -q fortune
    set -U fish_greeting (fortune)
else
    set -U fish_greeting
end
set XDG_PICTURES_DIR $HOME/Pictures
set XDG_CONFIG_DIRS "$HOME/.config"
set -x QT_QPA_PLATFORMTHEME qt5ct
set -U async_prompt_functions fish_prompt

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin
if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
end

if test -d "$HOME/.config/emacs/bin"
    fish_add_path "$HOME/.config/emacs/bin"
end

if test ! -f "$HOME/.tmux/plugins/tpm/tpm"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
end

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias confalacritty="$EDITOR ~/.local/share/chezmoi/dot_config/alacritty"
alias confghostty="$EDITOR ~/.local/share/chezmoi/dot_config/ghostty/config"
alias confwezterm="$EDITOR ~/.local/share/chezmoi/dot_config/wezterm/wezterm.lua"
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
