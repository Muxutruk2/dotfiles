if status is-interactive
    set EDITOR /usr/bin/nvim
    set -U fish_greeting
end

set XDG_PICTURES_DIR $HOME/Pictures
set -x QT_QPA_PLATFORMTHEME qt5ct

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias confalacritty="$EDITOR ~/.local/share/chezmoi/dot_config/alacritty"
alias confhypr="$EDITOR ~/.local/share/chezmoi/dot_config/hypr"
alias confnvim="$EDITOR ~/.local/share/chezmoi/dot_config/nvim"
alias conffish="$EDITOR ~/.local/share/chezmoi/dot_config/private_fish"
alias confwaybar="$EDITOR ~/.local/share/chezmoi/dot_config/waybar/config.jsonc"
alias confwaybarcss="$EDITOR ~/.local/share/chezmoi/dot_config/waybar/style.css"

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

function run
    if test -f $argv[1]
        set filename $argv[1]
        set output (basename $filename .c)
        gcc $filename -o $output -lm

        if test $status -eq 0
            ./$output
        else
            echo "Compilation failed."
        end
    else
        echo "File '$argv[1]' does not exist."
    end
end
