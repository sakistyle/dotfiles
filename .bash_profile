# .bash_profile

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Get the aliases and functions
if [[ -s /usr/local/bin/zsh ]]; then
  export SHELL=/usr/local/bin/zsh
  exec $SHELL -l
elif [[ -s /bin/zsh ]]; then
  export SHELL=/bin/zsh
  exec $SHELL -l
else
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

# User specific environment and startup programs

PATH=$PATH:/bin:$HOME/bin

export PATH


# exenv
export EXENV_ROOT="$HOME/.exenv"
export PATH="$EXENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# nodebrew
export NODEBREW_ROOT=$HOME/.nodebrew
export PATH=$NODEBREW_ROOT/current/bin:$PATH

# npm
#export PATH=$HOME/.npm/bin:$PATH
#export NODE_PATH=$HOME/.npm/libraries:$NODE_PATH
#export MANPATH=$HOME/.npm/man:$MANPATH

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# plenv
export PLENV_ROOT="$HOME/.plenv"
export PATH="$PLENV_ROOT/bin:$PATH"
eval "$(plenv init -)"

# rbenv
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

# scalaenv
export SCALAENV_ROOT="$HOME/.scalaenv"
export PATH="$SCALAENV_ROOT/bin:$PATH"
eval "$(scalaenv init -)"

# Docker
export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2376  #boot2dockeripコマンドの結果を設定。
export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
