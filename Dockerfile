# docker build -t ffmpeg-alpine:v1.0.0 .
FROM alpine:3.18

RUN apk update && apk upgrade && \
    # update ca-certificates
    apk add --update ca-certificates && \
    # install build base
    apk add --no-cache --virtual .build-dependencies build-base coreutils && \
    # install ffmpeg
    apk add ffmpeg && \
    # cleanup
    apk del --purge .build-dependencies && \
    rm -rf /var/cache/apk/*

ENTRYPOINT [ "/usr/bin/ffmpeg" ]
