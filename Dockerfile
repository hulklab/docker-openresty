FROM openresty/openresty:latest

ENV TZ=Asia/Shanghai

RUN echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian/ stretch main contrib non-free" > /etc/apt/sources.list && \
    # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ stretch main contrib non-free
    echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian/ stretch-updates main contrib non-free" >> /etc/apt/sources.list && \
    # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ stretch-updates main contrib non-free
    echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian/ stretch-backports main contrib non-free" >> /etc/apt/sources.list && \
    # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ stretch-backports main contrib non-free
    echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian-security stretch/updates main contrib non-free" >> /etc/apt/sources.list && \
    # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security stretch/updates main contrib non-free
    echo "deb http://openresty.org/package/debian stretch openresty" >> /etc/apt/sources.list

RUN apt-get update; \
    apt-get install -y git wget curl luarocks g++ cmake tzdata vim cron logrotate; \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN echo "alias ll='ls -l'" >> /root/.bashrc
