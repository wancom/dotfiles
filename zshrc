CURRENTSHELL=zsh

test -r ${HOME}/dotfiles/shrc && . ${HOME}/dotfiles/shrc

#----------------------------
# Use version control system info
autoload -Uz vcs_info

# Get VCS info before prompt
precmd () { vcs_info }

# VCS info config
# Load vcs info in detail (%s and %u will be available.)
zstyle ':vcs_info:git:*' check-for-changes true

# Replace %c with specified text if staged file exists.
zstyle ':vcs_info:git:*' stagedstr "%F{green}!"

# Replace %u with specified text if not staged file exists.
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+"

# VCS info formats
# %f: default color, %c: staged, %u: unstaged, %b: branch name
zstyle ':vcs_info:*' formats "%f%c%u(%b)%f"

# VCS info format (in operating)
# %a: action name(rebase, marge, etc..)
zstyle ':vcs_info:*' actionformats '[%b|%a]'

#----------------------------
#Prompt
# TODO: add color on/off option

# Use variable in prompt
setopt prompt_subst


# Date and time
PROMPT=$'%F{4}%D{%a %b %d} %*%f '

# Current directory
PROMPT=${PROMPT}$'%F{6}%~%f '

# git
PROMPT=${PROMPT}$'${vcs_info_msg_0_}\n'

# User@Host
PROMPT=${PROMPT}$'%F{2}%n@%m '

# %
PROMPT=${PROMPT}$'%F{3}%#%f '


#----------------------------

#----------------------------
#Other config

if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

fpath=(${HOME}/.zsh $fpath)
autoload -U compinit
compinit -u

setopt auto_pushd
setopt pushd_ignore_dups
setopt hist_ignore_space
setopt auto_param_slash
setopt mark_dirs
setopt list_types
setopt auto_menu
setopt auto_param_keys
setopt interactive_comments
setopt magic_equal_subst
setopt complete_in_word
setopt always_last_prompt
setopt print_eight_bit

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'

#cdpath=(${HOME} ${HOME}/project/)

zstyle ':completion:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*:manuals' separate-sections true

if [ -f "${HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ];then
  . "${HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
function cache_known_hosts (){
  if [ -d "$HOME/.ssh" ]; then
		test -f $HOME/dotfiles/cache/knownhostscache && rm $HOME/dotfiles/cache/knownhostscache
    if [ -f $HOME/.ssh/config ]; then
      cat $HOME/.ssh/config | grep -e "^Host" | grep -v "*" | sed 's/Host //g' >> $HOME/dotfiles/cache/knownhostscache
    fi
    (cat $HOME/.ssh/*/config | grep -e "^Host" | grep -v "*" | sed 's/Host //g') 2>/dev/null >> $HOME/dotfiles/cache/knownhostscache
  fi
}

test ! -f $HOME/dotfiles/cache/knownhostscache && cache_known_hosts
_cache_hosts=($( cat $HOME/dotfiles/cache/knownhostscache ))

#----------------------------
