if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
end

set -gx EDITOR nvim
set -gx MANPAGER 'nvim +Man!'

set -gx GOPATH "$HOME/go"

set PATH $PATH $HOME/.config/scripts
set PATH $PATH $HOME/go/bin

alias vim="nvim"
alias cat="bat"
alias g="git"

alias gs="git status --short"
alias gd="git diff --output-indicator-new=' ' --output-indicator-old=' '"
alias gl="git log --all --graph"

alias ga="git add"
alias gc="git commit"

alias gp="git push"
alias gu="git pull"
