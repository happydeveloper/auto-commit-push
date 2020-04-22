#!/bin/zsh

echo "-- auto commit push ---"
echo "1 시간에 한번씩 자동으로 커밋하고 푸시함 "
echo "변화가 없으면 커밋하지 않음"

stt=$(git status)
msg_date=$(date)
git status

echo "$?"
if [[ "$stt" = *"수정함:"* ]]; then
  echo "********************변화가 있다"
  git commit -am "$msg_date"
  git push origin master
  echo "$0"
  echo "*******************************"
else 
  echo "!!!!!!!!!!!!!!!!!!!!변화가 없다"
  exit 1
fi
