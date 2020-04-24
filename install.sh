#!/bin/sh

BREWINSTALLCMD='/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
GITHUBNAME="wancom"

echo Dotfile installer
echo
echo Following files are installed

printf "Do you want to continue?:"
read ANS
if [ "${ANS}" = "Y" -o "${ANS}" = "y" -o "${ANS}" = "YES" -o "${ANS}" = "yes" ];then

  ln -s dotfiles/common/logout ${HOME}/.bash_logout
  ln -s dotfiles/bash/bash_profile ${HOME}/.bash_profile
  ln -s dotfiles/bash/bashrc ${HOME}/.bashrc

  ln -s dotfiles/common/logout ${HOME}/.zlogout
  ln -s dotfiles/zprofile ${HOME}/.zprofile
  ln -s dotfiles/zshrc ${HOME}/.zshrc

  if [ "`uname`" = "Linux" -o "`uname`" = "SunOS" ];then
    ln -s dotfiles/common/dircolors ${HOME}/.dircolors
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
    brew bundle common/Brewfile
  fi
fi

if [ "`uname`" = "Linux" ];then
  echo "The machine is linux."
  printf "Do you want to register ssh public key from GitHub?:"
  read ANS
  if [ "${ANS}" = "Y" -o "${ANS}" = "y" -o "${ANS}" = "YES" -o "${ANS}" = "yes" ];then
    curl https://github.com/${GITHUBNAME}.keys >> ${HOME}/.ssh/authorized_keys
  fi
fi