FROM ubuntu:16.04
LABEL version='1.0.0'
 
USER root
 

RUN apt-get update
RUN apt-get upgrade -y

# container에 git 설치
RUN apt-get install git -y

# app 디렉토리 선정
RUN mkdir /opt/app

#RUN git clone git@github.com:happydeveloper/auto-commit-push.git /opt/app