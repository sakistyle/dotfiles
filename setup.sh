#!/bin/bash

DOTPATH=~/.dotfiles

echo "[info] Create a symbolic link."
for dotfile in .?*
do
  # exclude dot files.
  [ $dotfile = '..' ]       && continue
  [ $dotfile = '.git' ]     && continue
  [[ $dotfile =~ .vimrc. ]] && continue
  [[ $dotfile =~ .bck$ ]]   && continue

  echo -n "    ✔  $HOME/${dotfile} ... [ "

  ln -nfs $DOTPATH/$dotfile $HOME/$dotfile
  ret=$?

  if [ $ret -eq 0 ]; then
    echo -ne $'\e[32mOK\e[m'
  else
    echo -ne $'\e[31mNG\e[m'
  fi
  echo " ]"
done

# install NeoBundle
[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && echo "you should run following command to setup plugins ->  vim -c ':NeoBundleInstall'"
