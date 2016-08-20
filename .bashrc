#       ___           ___           ___           ___           ___           ___      
#      /\  \         /\  \         /\  \         /\__\         /\  \         /\  \     
#     /::\  \       /::\  \       /::\  \       /:/  /        /::\  \       /::\  \    
#    /:/\:\  \     /:/\:\  \     /:/\ \  \     /:/__/        /:/\:\  \     /:/\:\  \   
#   /::\~\:\__\   /::\~\:\  \   _\:\~\ \  \   /::\  \ ___   /::\~\:\  \   /:/  \:\  \  
#  /:/\:\ \:|__| /:/\:\ \:\__\ /\ \:\ \ \__\ /:/\:\  /\__\ /:/\:\ \:\__\ /:/__/ \:\__\ 
#  \:\~\:\/:/  / \/__\:\/:/  / \:\ \:\ \/__/ \/__\:\/:/  / \/_|::\/:/  / \:\  \  \/__/ 
#   \:\ \::/  /       \::/  /   \:\ \:\__\        \::/  /     |:|::/  /   \:\  \       
#    \:\/:/  /        /:/  /     \:\/:/  /        /:/  /      |:|\/__/     \:\  \      
#     \::/__/        /:/  /       \::/  /        /:/  /       |:|  |        \:\__\     
#      ~~            \/__/         \/__/         \/__/         \|__|         \/__/     
#  

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


#-----------------------------
# Default
#-----------------------------
# 新しく作られたファイルのパーミッションがつねに    644 になるようにする。基本。
umask 022



#-----------------------------
# Prompt
#-----------------------------
export PS1="[\[\033[1;34m\]\u\[\033[0m\]@\[\033[1;32m\]\h\[\033[0m\] \[\033[1;36m\]\t\[\033[0m\] \[\033[1;31m\]\w\[\033[0m\]]\n$ "


#-----------------------------
# Path
#-----------------------------
export RUBYLIB=~/projects/NextCore/lib


#-----------------------------
# Prompt
#-----------------------------

export EDITOR=vim
export SVN_EDITOR=vim
export GIT_EDITOR=vim
export VISUAL=vim
export PAGER=less
export BLOCKSIZE=K
export TERM=xterm-256color


#-----------------------------
# User specific aliases and functions
#-----------------------------

alias ls='ls -F --color=auto'
alias la='ls -la --color=auto'
alias ll='ls -lA --color=auto'
alias pwd='echo $cwd'
alias bell='echo ?a'
alias memo='vi ~/memo.txt'

## コマンドを置き換える
alias vi='vim -u /home/sasakiy/.vimrc'
alias sc='screen'
alias tm='tmux'

## パイプ,コマンドの連結
alias dusort='du ?!* | sort -rn | more'
alias lsl='ls ?!* | less'
#alias lll='ls -al | less'
alias psa='ps auxw | grep ${USER} | grep -v "ps -auxw" | grep -v grep'
alias psg='ps auxw | grep ?!* | grep -v "ps -auxw" | grep -v grep'
alias pst='ps auxw | sort +4nr | grep -v "ps -auxw" | grep -v grep'
#alias cd='cd ?!* ; ls'

## オプション
alias mv='mv -i' # 上書き時に尋ねる
alias cp='cp -i' # 上書き時に尋ねる
alias du='du -k' # kB表示
alias su='su -'
alias ls='ls -F --color=tty' # ファイルタイプを表示
alias kterm='kterm -sb -sl 500 -km euc -title kterm@$HOST ?!* &'

## バックグラウンド
alias gv='gv ?!* &'
alias mozilla='mozilla ?!* &'
alias xcalc='xcalc &'
alias xdvi='xdvi ?!* &'
alias xterm='xterm &'
alias vasp='vasp >& stdout & jobs'

## typo 対策
alias cd..='cd ..'
alias sl='ls'
alias kls='ls'
alias lf='ls'
alias qls='ls'
alias l='ls'
alias s='ls'
alias les='less'


LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH


[[ -s "/home/sasakiy/.gvm/scripts/gvm" ]] && source "/home/sasakiy/.gvm/scripts/gvm"
