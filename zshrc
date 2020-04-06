CURRENTSHELL=zsh

test -r ~/dotfiles/shrc && . ~/dotfiles/shrc


#----------------------------
#Prompt
# TODO: add color on/off option

autoload -Uz vcs_info
setopt prompt_subst

precmd () { vcs_info }

zstyle ':vcs_info:git:*' check-for-changes true #formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{green}!" #commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+" #add されていないファイルがある
zstyle ':vcs_info:*' formats "%f%c%u(%b)%f" #通常
zstyle ':vcs_info:*' actionformats '[%b|%a]' #rebase 途中,merge コンフリクト等 formats 外の表示

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

fpath=(~/.zsh $fpath)
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

#cdpath=(~ ~/project/)

zstyle ':completion:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*:manuals' separate-sections true

if [ -f "${HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ];then
  . "${HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
function cache_known_hosts (){
  if [ -d "$HOME/.ssh" ]; then
		test ! -f $HOME/dotfiles/knownhostscache && rm $HOME/dotfiles/knownhostscache
    if [ -f $HOME/.ssh/config ]; then
      cat $HOME/.ssh/config | grep -e "^Host" | grep -v "*" | sed 's/Host //g' >> $HOME/dotfiles/knownhostscache
    fi
    (cat $HOME/.ssh/*/config | grep -e "^Host" | grep -v "*" | sed 's/Host //g') 2>/dev/null >> $HOME/dotfiles/knownhostscache
  fi
}

test ! -f $HOME/dotfiles/knownhostscache && cache_known_hosts
_cache_hosts=($( cat $HOME/dotfiles/knownhostscache ))

#----------------------------
