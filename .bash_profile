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

export PATH="$HOME/.cargo/bin:$PATH"
