## Dockerfile for gitit

FROM debian:wheezy
MAINTAINER menduo "shimenduo@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

# install git, ssh, supervisor
RUN apt-get update && apt-get install -y git gitit supervisor libghc-zlib-dev

RUN echo "root:github.com/menduo" | chpasswd

VOLUME ["/data/gitit"]
WORKDIR /data/gitit

ADD . /data/gitit

EXPOSE 7500

ENTRYPOINT ["/data/gitit/docker-entrypoint.sh"]