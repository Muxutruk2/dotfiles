function silent_add_path
    for dir in $argv
        test -d $dir; and fish_add_path $dir
    end
end

function if_command_run
    set -l cmd $argv[1]
    set -e argv[1]

    type -q $cmd; and eval $argv
end

function source_if_exists
    if test -f $argv[1]
        source $argv[1]
    end
end

function git_clone_if_not_exists
    if test ! -f $argv[1]
        git clone $argv[2]
    end
end

fish_hybrid_key_bindings # Vim mod with default fish bindings

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
source_if_exists "$HOME/.cargo/env.fish"
source_if_exists "$HOME/.config/fish/aliases.fish"
git_clone_if_not_exists "$HOME/.tmux/plugins/tpm/tpm" "https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
