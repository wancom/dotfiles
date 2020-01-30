CURRENTSHELL=bash

echo Loading bashrc...

test -r ~/dotfiles/shrc && . ~/dotfiles/shrc

#----------------------------
#Prompt
# TODO: add color on/off option
GIT_PS1_SHOWCOLORHINTS=true

# Date and time
PS1='\[\e[0;34m\]\d \t\[\e[0m\] '

# Current directory
PS1=${PS1}'\[\e[0;36m\]\w\[\e[0m\]'

# git
PS1=${PS1}'$(__git_ps1)\n'

# User@Host
PS1=${PS1}'\[\e[0;32m\]\u@\h\[\e[0m\] '

# %
PS1=${PS1}'\[\e[0;33m\]\$\[\e[0m\] '


#----------------------------
#Other config

#Bash options
shopt -s histappend
shopt -s checkwinsize

# Bach Completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  elif [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
  fi
fi

GITCOMPPATH="/Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash"
if [ -f ${GITCOMPPATH} ]; then
. ${GITCOMPPATH}
fi
