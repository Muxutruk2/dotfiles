function silent_add_path --description 'Silently adds directories to the PATH if they exist.'
    for dir in $argv
        if test -d "$dir"
            fish_add_path "$dir" >/dev/null 2>&1
        end
    end
end

function command_exists --argument-names cmd --description 'Checks if a command exists in the PATH.'
    type -q $cmd; or return 1
    return 0
end

function if_command_run --argument-names cmd args --description 'Runs a command if it exists.'
    if command_exists "$cmd"
        eval "$args"
    end
end

function git_clone_if_not_exists --argument-names path repo_url --description 'Clones a Git repository if it does not already exist.'
    if test -z "$path" -o -z "$repo_url"
        echo "Error: Path or repository URL is missing."
        return 1
    end
    if test ! -d "$path"
        git clone "$repo_url" "$path"
    end
end

function is_no_de --description 'Checks if the current shell is running in a bare-bones terminal'
    if test "$TERM" = linux
        return 0
    end

    return 1
end

if command_exists eza
    and not is_no_de
    alias ls='eza --icons --color=always'
    alias lls='ls --color=always'
end

if command_exists bat
    and status is-interactive
    and not is_no_de
    alias cat='bat'
    alias ccat='command cat'
    set -x MANPAGER "sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

end

if command_exists tree
    alias tree='tree -C'
end

if command_exists nvim
    set -x EDITOR (which nvim)
    alias vim='nvim'
    alias vi='nvim'

    function sudo
        if test "$argv[1]" = nano
            command sudo nvim $argv[2..-1]
        else
            command sudo $argv
        end
    end
else
    if command_exists vim
        set -x EDITOR (which vim)
        alias nvim='vim'
        alias vi='vim'
        function sudo
            if test "$argv[1]" = nano
                command sudo vim $argv[2..-1]
            else
                command sudo $argv
            end
        end
    else
        echo "Neither neovim nor vim are installed"
    end
end

if command_exists git
    abbr --add gs 'git status'
    abbr --add gl 'git log --oneline --graph --decorate'
    abbr --add gc 'git commit -m'
    abbr --add ga 'git add .'
    abbr --add gd 'git diff'
    abbr --add gds 'git diff --cached'
    abbr --add gco 'git checkout'
    abbr --add gcb 'git checkout -b'
    abbr --add gp 'git pull'
    abbr --add gps 'git push'
    abbr --add gr 'git reset --hard'
    abbr --add gla 'git log --oneline --graph --decorate --all'
    abbr --add gst 'git stash'
    abbr --add gsa 'git stash apply'
    abbr --add gb 'git branch'
    abbr --add grm 'git remote -v'
    abbr --add gclean 'git clean -fd'
    abbr --add gpl 'git pull --rebase'
    abbr --add gpr 'git pull --rebase origin master'
    abbr --add gch 'git checkout'
else
    echo "Git not found, skipping Git aliases and abbreviations."
end

if command_exists htop and status is-interactive
    alias top='htop'
end

alias grep='grep -i --color=auto'
alias df='df -h'
alias du='du -h'
