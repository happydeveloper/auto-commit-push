#!/bin/zsh

echo "-- auto commit push ---"
echo "변화가 없으면 커밋하지 않음"

stt=$(git status)
m="$(git status --short)"
msg_date=$(date)
commit_msg="$(git diff)"
git status
git add .
echo "$?"
if [[ "$stt" = *"수정함:"* ]] || [[ "$stt" = *"새 파일:"* ]] || [[ "$stt" = *"삭제함:"* ]]; then
  echo "********************변화가 있다********************"
  git add .
  git commit -am "$m - $commit_msg - $msg_date "
  git push origin master
  echo "$0"
  echo "*************************************************"
else 
  echo "!!!!!!!!!!!!!!!!!!!!변화가 없다!!!!!!!!!!!!!!!!!!"
  echo "!!!!!!!!!!!!!!!!!!!!변화가 없다!!!!!!!!!!!!!!!!!!"
  echo "!!!!!!!!!!!!!!!!!!!!변화가 없다!!!!!!!!!!!!!!!!!!"
fi

