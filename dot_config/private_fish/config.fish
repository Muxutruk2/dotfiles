if status is-interactive
    set EDITOR /usr/bin/nvim
end

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# Fish Shell Specific
alias conffish='nvim ~/.config/fish/config.fish' # Open Fish configuration
alias conffishfuncs='nvim ~/.config/fish/functions/' # Open Fish functions directory

# Kitty Terminal
alias confkitty='nvim ~/.config/kitty/kitty.conf' # Open Kitty configuration
alias confalacritty='nvim ~/.config/alacritty/alacritty.yml'

# Neovim
alias confnvim='nvim ~/.config/nvim/init.vim' # Open Neovim configuration
alias confnvimlua='nvim ~/.config/nvim/lua/plugins/init.lua' # Open Neovim Lua plugins config

# Neovim Plugins
alias confnvimplugins='nvim ~/.config/nvim/lua/plugins/' # Open Neovim plugins directory

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
