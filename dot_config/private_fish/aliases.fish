function silent_add_path
    for dir in $argv
        test -d $dir; and fish_add_path $dir
    end
end

function command_exists
    set -l cmd $argv[1]
    type -q $cmd; or return 1
    return 0
end

function if_command_run
    set -l cmd $argv[1]
    set -e argv[1]

    command_exists $cmd; and eval $argv
end

function git_clone_if_not_exists
    if test ! -f $argv[1]
        git clone $argv[2]
    end
end

if command_exists eza
    alias ls='eza --icons --color=always'
end

if command_exists bat
    if status is-interactive
        alias cat='bat'
    end
end

if command_exists tree
    alias tree='tree -C'
end

if command_exists nvim
    alias vim='nvim'
    alias vi='nvim'
end

if command_exists git
    alias gs='git status'
    alias gl='git log --oneline --graph --decorate'
else
    echo "Git not installed"
end

if command_exists htop
    alias top='htop'
end

alias grep='grep -i --color=auto'
alias df='df -h'
alias du='du -h'
