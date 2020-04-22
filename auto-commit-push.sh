#!/bin/zsh
# git config --global alias.auto-commit-push '!auto-commit-push.sh' 
# brew install watch

echo "-- auto commit push ---"
echo "1 시간에 한번씩 자동으로 커밋하고 푸시함 "
echo "변화가 없으면 커밋하지 않음"

stt=$(git status)
m="$(git status --short)"
msg_date=$(date)
git status
git add .
echo "$?"
if [[ "$stt" = *"수정함:"* ]] || [[ "$stt" = *"새 파일:"* ]] || [[ "$stt" = *"삭제함:"* ]]; then
  echo "********************변화가 있다"
  git add .
  git commit -am "$m - $msg_date "
  git push origin master
  echo "$0"
  echo "*******************************"
else 
  echo "!!!!!!!!!!!!!!!!!!!!변화가 없다"
  #exit 1
fi

