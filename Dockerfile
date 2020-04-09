FROM alpine:3.7
RUN apk --no-cache add tzdata && cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime
ENTRYPOINT ["tz"]

#java start(low)
FROM openjdk:11-jdk-slim-stretch
RUN echo 'deb http://deb.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/backports.list
#java end

WORKDIR /app
COPY demo-web-mvc-0.0.1-SNAPSHOT.jar demo-web-mvc-0.0.1-SNAPSHOT.jar
COPY entrypoint.sh run.sh
RUN chmod 774 run.sh

ENV PROFILE=local

ENTRYPOINT ["tz","./run.sh"]