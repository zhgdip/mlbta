FROM alpine:latest

RUN apk add --no-cache curl ca-certificates

WORKDIR /app

COPY sing-box .
COPY config.json .
COPY entrypoint.sh .

RUN chmod +x ./sing-box ./entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["./entrypoint.sh"]