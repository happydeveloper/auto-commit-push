#!/bin/zsh

#branch=$(cat .git/HEAD | grep "[^ref: refs/heads].")
branch=$(cat .git/HEAD)

echo ${branch#*ref: refs/heads/}

if $branch = 'master' then;
    git merge log
fi