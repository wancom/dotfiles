#!/bin/sh

BREWINSTALLCMD='/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
GITHUBNAME="wancom"

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

  if [ "`uname`" = "Linux" ];then
    ln -s dotfiles/dircolors ~/.dircolors
  fi
fi

if [ "`uname`" = "Darwin" ];then
  echo "The machine is macOS."
  printf "Do you want to install homebrew?:"
  read ANS
  if [ "${ANS}" = "Y" -o "${ANS}" = "y" -o "${ANS}" = "YES" -o "${ANS}" = "yes" ];then
    ${BREWINSTALLCMD}
  fi
  printf "Do you want to install Brewfile?:"
  read ANS
  if [ "${ANS}" = "Y" -o "${ANS}" = "y" -o "${ANS}" = "YES" -o "${ANS}" = "yes" ];then
    brew bundle Brewfile
  fi
fi

if [ "`uname`" = "Linux" ];then
  echo "The machine is linux."
  printf "Do you want to register ssh public key from GitHub?:"
  if [ "${ANS}" = "Y" -o "${ANS}" = "y" -o "${ANS}" = "YES" -o "${ANS}" = "yes" ];then
    curl https://github.com/${GITHUBNAME}.keys >> ~/.ssh/authorized_keys
  fi
fi