#!/bin/sh

echo Dotfile installer
echo
echo Following files are installed

printf "Do you want to continue?:"
read ANS
if [ "${ANS}" = "Y" -o "${ANS}" = "y" -o "${ANS}" = "YES" -o "${ANS}" = "yes" ];then

ln -s dotfiles/logout ~/.bash_logout
ln -s dotfiles/bash_profile ~/.bash_profile
ln -s dotfiles/bashrc ~/.bashrc

ln -s dotfiles/logout ~/.zlogout
ln -s dotfiles/zprofile ~/.zprofile
ln -s dotfiles/zshrc ~/.zshrc

fi
