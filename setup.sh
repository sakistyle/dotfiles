#!/bin/bash

DOTPATH=~/.dotfiles

echo "[info] Create symbolic links."
for dotfile in .?*
do
  # exclude dot files.
  [[ ${dotfile} = '..' ]]     && continue
  [[ ${dotfile} = '.git' ]]   && continue
  [[ ${dotfile} =~ .vimrc. ]] && continue
  [[ ${dotfile} =~ .bck$ ]]   && continue

  echo -n "    ✔  ${HOME}/${dotfile} ... [ "

  [[ -f ${HOME}/${dotfile} ]] && mv ${HOME}/${dotfile} ${HOME}/${dotfile}.bck
  ln -nfs ${DOTPATH}/${dotfile} ${HOME}/${dotfile}
  ret=$?

  if [ $ret -eq 0 ]; then
    echo -ne $'\e[32mOK\e[m'
  else
    echo -ne $'\e[31mNG\e[m'
  fi
  echo " ]"
done

# install TmuxPluginManager
[ ! -d ~/.tmux/plugins ] && mkdir -p ~/.tmux/plugins && [ ! -d ~/.tmux/plugins/tpm ] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && tmux source ~/.tmux.conf

# install NeoBundle
[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && echo "you should run following command to setup plugins ->  vim -c ':NeoBundleInstall'"
