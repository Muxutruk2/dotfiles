set -g fish_greeting ""

function source_if_exists
    if test -f $argv[1]
        source $argv[1]
    end
end

source_if_exists "$HOME/.config/fish/aliases.fish"

if is_no_de
    function fish_prompt
        set_color green
        printf "%s@%s %s ~> " (whoami) (hostname) (pwd)
        set_color normal
    end
end

set -x EDITOR nvim

# Tide config
set -x tide_pwd_color_anchors b5d607
set -x tide_pwd_color_dirs c0b341
set -x tide_pwd_icon_home ''

# XDG config
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_STATE_HOME "$HOME/.local/state"
set -x XDG_DESKTOP_DIR "$HOME/Desktop"
set -x XDG_DOCUMENTS_DIR "$HOME/Documents"
set -x XDG_DOWNLOAD_DIR "$HOME/Downloads"
set -x XDG_MUSIC_DIR "$HOME/Music"
set -x XDG_PICTURES_DIR "$HOME/Pictures"
set -x XDG_PUBLICSHARE_DIR "$HOME/Public"
set -x XDG_TEMPLATES_DIR "$HOME/Templates"
set -x XDG_VIDEOS_DIR "$HOME/Videos"

# QT Config
set -x QT_QPA_PLATFORMTHEME qt5ct

silent_add_path "$HOME/.cargo/bin" "$HOME/.local/bin" "$HOME/.config/emacs/bin"
if_command_run pyenv 'pyenv init - | source'
if_command_run fish_hybrid_key_bindings fish_hybrid_key_bindings
# if_command_run tide "tide configure --auto --style=Lean --prompt_colors='True color' --show_time=No --lean_prompt_height='One line' --prompt_spacing=Sparse --icons='Few icons' --transient=Yes"
source_if_exists "$HOME/.cargo/env.fish"
git_clone_if_not_exists "$HOME/.tmux/plugins/tpm/tpm" "https://github.com/tmux-plugins/tpm"
