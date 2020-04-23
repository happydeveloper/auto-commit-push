# 자동 커밋 푸시
- 파일의 변화를 특정시간 마다 체크해서 자동으로 커밋하고 푸시해주는 어플리케이션 


## 특징
- macOS에서만 지원.
- 소스 파일안에 바로 커밋메시지 작성. #cmsg  태깅한 문장을 찾아 커밋메시지 작성 
- 커밋메시지 자동 생성 (컨텍스트를 분석해서 특별하게 지정안할 경우 기계적으로 작성)

## 설치
```
$ git clone 
$ chmod +x install.sh auto-commit.sh auto-commit-push.sh
$ source ./auto-commit.sh
```


## 사용법
```
$ git init # git 레파지토리 안에서 실행 #3 분마다 파일 변경사항 체크하여 커밋후 푸시 
$ auto-commit 3 
$ echo "#cmsg 커밋 메시지 줄 출력" >> test.txt
```

## 시현

dd
ddd
dd


예제작성하고 


<!-- #cmsg 예제테스트  -->

