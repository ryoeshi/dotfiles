#!/bin/sh -eux

# check command.
git --version >/dev/null

dot_dir=dotfiles

cd ${HOME}
pwd

echo 'create symbolic links.'
for n in ${dot_dir}/dot.*
do
  if [ ! -e $n ] ; then
    ln -s $n `echo $n | sed -e "s/${dot_dir}\/dot././"`
  fi
done

#pm_dir=~/.vim/dein/repos/dein.vim
#pm_repo=https://github.com/Shougo/dein.vim.git
pm_dir=~/.vim/bundle/neobundle.vim
pm_repo=https://github.com/Shougo/neobundle.vim

echo 'get plugin manager.'
mkdir -p ${pm_dir}
git clone ${pm_repo} ${pm_dir}

echo 'setup completed.'

