#!/bin/sh -eux

# check command.
git --version >/dev/null

echo 'create symbolic links.'
dot_dir=${HOME}/dotfiles
for n in ${dot_dir}/dot.*
do
  filename=`echo $n | sed -e "s:${dot_dir}/dot.:.:"`
  dest_path=${HOME}/${filename}
  if [ ! -e ${dest_path} ] ; then
    ln -s $n ${dest_path}
  fi
done

echo 'get plugin manager.'
#pm_dir=${HOME}/.vim/dein/repos/dein.vim
#pm_repo=https://github.com/Shougo/dein.vim.git
pm_dir=${HOME}/.vim/bundle/neobundle.vim
pm_repo=https://github.com/Shougo/neobundle.vim
if [ ! -d ${pm_dir} ] ; then
  mkdir -p ${pm_dir}
  git clone ${pm_repo} ${pm_dir}
fi

zprezto_dir=${HOME}/.zprezto/runcoms
if [ -d "${zprezto_dir}" ] ; then
  echo 'custom zsh config.'
  custom_dir=${dot_dir}/custom/zprezto-runcoms
  for n in ${custom_dir}/*
  do
    filename=`echo $n | sed -e "s:${custom_dir}/::"`
    dest_path=${zprezto_dir}/${filename}
    if [ ! -e "${dest_path}" ] ; then
      ln -s $n ${dest_path}
    fi
  done
fi

echo 'setup completed.'

