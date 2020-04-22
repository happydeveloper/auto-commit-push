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
  watch -n $1 ./auto-commit-push.sh
fi

#For MacOSX, install coreutils (which includes greadlink)
# $brew install coreutils
if [ "${OSTYPE:0:6}" == "darwin" ]; then
    READLINK="greadlink"
else
    READLINK="readlink"
fi

SHELL_HISTORY=~/.auto-commit_history
DU_OPT="-q"
BIN_DEPS="id $READLINK ls basename ls pwd cut"
VERSION="0.2"

umask 077

#Dependencies check
for i in $BIN_DEPS; do
    which $i > /dev/null
    if [ $? -ne 0 ]; then
        echo -e "Error: Required program could not be found: $i"
        exit 1
    fi
done


#Looking for auto-commit
if [ -f "./auto-commit.sh" ]; then
    DU="./auto-commit.sh"
else
    DU=$(which auto-commit.sh)
    if [ $? -ne 0 ]; then
        echo "auto-commit Uploader not found!"
        exit 1
    fi
fi

#Check DropBox Uploader
if [ ! -f "$DU" ]; then
    echo "Dropbox Uploader not found: $DU"
    echo "Please change the 'DU' variable according to the Dropbox Uploader location."
    exit 1
else
    DU=$($READLINK -m "$DU")
fi
