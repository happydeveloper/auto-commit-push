#!/bin/zsh

#Check the shell
if [ -z "$BASH_VERSION" ]; then
    echo -e "Error: this script requires the BASH shell!"
    exit 1
fi
./auto-commit-push.sh 
