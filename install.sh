#!/bin/zsh

install_app=$(pwd)/auto-commit.sh
install_app_2=$(pwd)/auto-commit-push.sh
echo $install_app
ln -s $install_app /usr/local/bin/auto-commit
ln -s $install_app_2 /usr/local/bin/auto-commit-push
