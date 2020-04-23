#!/bin/zsh

echo "-- auto commit push ---"
echo "변화가 없으면 커밋하지 않음"

stt=$(git status)
m="$(git status --short)"
msg_date=$(date)
commit_msg="$(git diff)"
if [[ "$msg" = *"#cmsg"* ]]; then #cmsg 태그가 있으면 메시지를 grep해서 출력해줌
  commit_msg="$(git diff | grep "#cmsg")"
fi

git checkout -b logs #logs 브랜치 이동
branch=$(cat .git/HEAD)

git status
git add .
if [[ "$stt" = *"수정함:"* ]] || [[ "$stt" = *"새 파일:"* ]] || [[ "$stt" = *"삭제함:"* ]]; then
  echo "********************변화가 있다********************"
  git add .
  git commit -am "$m - $commit_msg - $msg_date "
  git push origin ${branch#*ref: refs/heads/}
  # 정시마다 마스터에 logs 브랜츠를 머지하고 
  # 여러개 커밋메시지를 하나로 합친다.
  # 하나로 합치면 태깅을 한다.
  echo "$0"
  echo "*************************************************"
else 
  echo "!!!!!!!!!!!!!!!!!!!!변화가 없다!!!!!!!!!!!!!!!!!!"
  echo "!!!!!!!!!!!!!!!!!!!!변화가 없다!!!!!!!!!!!!!!!!!!"
  echo "!!!!!!!!!!!!!!!!!!!!변화가 없다!!!!!!!!!!!!!!!!!!"
fi

