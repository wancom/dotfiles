CURRENTSHELL=bash

echo Loading bashrc...

test -r ~/dotfiles/shrc && . ~/dotfiles/shrc



#----------------------------

#----------------------------

#----------------------------
#Prompt
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

#----------------------------
#Other config

# Bach Completion
BASHCOMPPATH="/usr/local/etc/bash_completion"
if [ -f ${BASHCOMPPATH} ]; then
. ${BASHCOMPPATH}
fi
GITCOMPPATH="/Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash"
if [ -f ${GITCOMPPATH} ]; then
. ${GITCOMPPATH}
fi


#Bash options
shopt -s histappend

#----------------------------

