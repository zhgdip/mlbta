FROM alpine:latest

WORKDIR /app

# 安装依赖
RUN apk add --no-cache curl ca-certificates

# 下载 sing-box（最新版）
RUN curl -L -o sing-box.tar.gz https://github.com/SagerNet/sing-box/releases/latest/download/sing-box-linux-amd64.tar.gz && \
    tar -xzvf sing-box.tar.gz && \
    cp sing-box-*/sing-box /usr/bin/sing-box && \
    chmod +x /usr/bin/sing-box && \
    rm -rf sing-box*

COPY 配置.json /etc/sb/config.json
COPY 入口点.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
