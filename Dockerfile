#1. FROM base image로 시작
#node 16버전, alpine(엘파인): 최소단위, 작은 단위의 리눅스 버전을 말함
FROM node:16-alpine 
#2. docker 안에서의 경로를 설정
#/app로 모든걸 복사
WORKDIR /app

COPY package.json package-lock.json ./
# npm install은 package.json에 명시된 버전에서 범위에 맞는 최신 버전을 설치 (개발 시점 버전 != 설치 시점 버전)
# npm ci은 package-lock.json을 통해 명시된 버전을 설치 (개발 시점 버전 === 설치 시점 버전)
RUN npm ci

COPY index.js ./

ENTRYPOINT [ "node", "index.js" ]

#레이어로 실행이므로 빈번히 번복되는 파일일 수록 하단에 작성

#docker image 파일 만들기
#docker build -f Dockerfile -t fun-docker .
#마지막 .은 최상위 경로를 지정
#-f 옵션은 어떤 파일을 사용하는지 지정
#-t docker image에 이름을 부여

#docker run -d -p 8080:8080 fun-docker
#-d detached
#-p 8080:8080 포트연결 - 컨테이너 포트 : 호스트 머신 포트 

#docker ps
#현재 실행되고 있는 도커를 알 수 있음

#docker logs [container name]

#docker tag fun-docker:latest minyeongnam/docker-example:latest
#docker tag image:tagname docker image 이름 변경
