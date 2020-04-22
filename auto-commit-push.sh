#!/bin/zsh

echo "-- auto commit push ---"
echo "1 시간에 한번씩 자동으로 커밋하고 푸시함 "
echo "변화가 없으면 커밋하지 않음"

git status

echo "$?"
if [ "$?" = "0" ]; then
  echo "********************변화가 있다"
  echo "$1"
else 
  echo "!!!!!!!!!!!!!!!!!!!!변화가 없다"
  exit 1
fi
