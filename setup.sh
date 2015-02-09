#!/bin/sh -eux

DOT_DIR=dotfiles

cd $HOME
pwd

for n in $DOT_DIR/dot.*
do
    ln -s $n `echo $n | sed -e "s/$DOT_DIR\/dot././"`
done

echo 'setup completed.'

