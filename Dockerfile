FROM openresty/openresty:latest

ENV TZ=Asia/Shanghai

RUN apt-get update; \
    apt-get install -y apt-utils git wget curl luarocks g++ cmake tzdata vim cron logrotate; \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN echo "alias ll='ls -l'" >> /root/.bashrc
