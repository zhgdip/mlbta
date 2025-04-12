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

# 拷贝配置文件和入口脚本
COPY config.json /etc/sb/config.json
COPY entrypoint.sh /entrypoint.sh

# 添加执行权限
RUN chmod +x /entrypoint.sh

# 设置容器入口
ENTRYPOINT ["/entrypoint.sh"]
