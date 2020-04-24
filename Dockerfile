FROM ubuntu:16.04
LABEL version='1.0.0'
 
USER root
 
# sources.list 교체 후 적용
COPY sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# container에 git 설치
RUN apt-get install git -y