FROM openresty/openresty:1.15.8.2-6-buster

ENV TZ=Asia/Shanghai

RUN apt-get update; \
    apt-get install -y apt-utils git wget curl luarocks g++ cmake tzdata vim cron logrotate iputils-ping; \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN echo "alias ll='ls -l'" >> /root/.bashrc
