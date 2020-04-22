#!/bin/zsh

install_chk=$(which watch)
#Check the shell
if [[ "$install_chk" = *"not found"* ]]; then
    brew install watch
    exit 1
fi

watch -n 2 ./auto-commit-push.sh

