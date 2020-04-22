#!/bin/zsh

install_chk=$(which watch)
#Check the shell
if [[ "$install_chk" = *"not found"* ]]; then
    brew install watch
    source ./auto-commit.sh
    exit 1
fi

if [ $# -ne 1 ]; then
  echo "파라미터가 필요합니다. "
  echo "Usage: $0 60 #60초마다 파일 체크후 보내기"
  exit -1
else
  watch -n $1 ./auto-commit-push
fi

echo "$1 초마다 변경된 파일 자동 커밋과 푸시"
