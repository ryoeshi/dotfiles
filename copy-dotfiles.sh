#!/bin/sh

FILES="dot.gitconfig dot.screenrc dot.vimrc"
DOTFILES="dotfiles"

for n in ${FILES}
do
  DOTFILE=${n#dot}
  if [ -e ~/${DOTFILE} ] ; then
    echo "exists ${DOTFILE}. skipping."
  else
    ln -s ${DOTFILES}/${n} ~/${DOTFILE}
  fi
done

