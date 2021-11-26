if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
bind \t forward-word
set -gx PATH "$HOME/.cargo/bin" $PATH;
