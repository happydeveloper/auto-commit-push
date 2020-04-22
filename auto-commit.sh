#!/bin/zsh

install_chk=$(which watch)
#Check the shell
if [[ "$install_chk" = *"not found"* ]]; then
    brew install watch
    ./auto_commit.sh
    exit 1
fi

watch -n 2 ./auto-commit-push.sh

