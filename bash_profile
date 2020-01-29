CURRENTSHELL=bash

echo Loading bash_profile...

test -r ~/dotfiles/profile && . ~/dotfiles/profile

test -r ~/.bashrc && . ~/.bashrc