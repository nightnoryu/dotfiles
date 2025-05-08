if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
end

set -gx EDITOR nvim
set -gx MANPAGER 'nvim +Man!'

set -gx GOPATH "$HOME/go"

set PATH $PATH $HOME/.config/scripts
set PATH $PATH $HOME/go/bin
