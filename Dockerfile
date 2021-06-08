# syntax=docker/dockerfile:1
FROM maven:3.6.1-jdk-8-alpine
RUN sed -i "s@http://dl-cdn.alpinelinux.org/@https://repo.huaweicloud.com/@g" /etc/apk/repositories \
&& apk add --update ttf-dejavu fontconfig
WORKDIR /app
COPY . .
RUN mvn clean package -Dmaven.test.skip=true
WORKDIR ./ruoyi-admin/target
ARG JAVA_OPTS=-Xms256m -Xmx1024m -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m
CMD java -jar $JAVA_OPTS ruoyi-admin.jar