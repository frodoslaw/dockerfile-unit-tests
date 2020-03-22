FROM alpine:3.9.5

RUN addgroup -g 1000 application \
    && adduser -u 1000 -D -G application application
