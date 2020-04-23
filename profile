# Path config

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/local/bin" ] && PATH=$HOME/local/bin:$PATH
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"


# Set golang path if it exists
if [ -d "$HOME/project/go" ] ; then
  export GOPATH=$HOME/project/go
  PATH=$GOPATH/bin:$PATH
fi


# Locale config
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
