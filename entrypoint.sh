#!/bin/sh

exec java -Djava.security.egd=file:/dev/./urandom \
          -jar demo-web-mvc-0.0.1-SNAPSHOT.jar