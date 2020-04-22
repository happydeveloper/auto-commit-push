#!/bin/zsh

install_app=$(pwd)/auto-commit.sh
echo $install_app
ln -s $install_app /usr/local/bin/auto-commit
