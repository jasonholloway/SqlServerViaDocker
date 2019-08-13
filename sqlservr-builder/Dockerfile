FROM alpine:3.10

# install bash, docker cli and dos2unix
RUN apk add --update curl bash \
  && apk add dos2unix --repository http://dl-3.alpinelinux.org/alpine/edge/community/ \
  && curl -L https://download.docker.com/linux/static/stable/x86_64/docker-18.06.3-ce.tgz | tar xfz - \
  && mv ./docker/docker /usr/bin/docker && rm -rf ./docker \
  && apk del curl \
  && rm -rf /var/cache/apk/* 

WORKDIR /build
COPY ./ ./
RUN dos2unix *.sh

CMD ["./run.sh"]
