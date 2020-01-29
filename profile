echo Loading profile...
#----------------------------
# Path config

# Set user local bin
if [ -d $HOME/local/bin ]; then
  PATH=$HOME/local/bin:$PATH
fi

# Set golang path
export GOPATH=$HOME/project/golang
PATH=$PATH:$GOPATH/bin
#----------------------------
# Locale config
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
#----------------------------
