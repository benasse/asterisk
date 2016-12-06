FROM debian:jessie
MAINTAINER dev+docker@proformatique.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -q update && apt-get -q -y install \
    apt-utils \
    wget
RUN echo "deb http://mirror.wazo.community/debian/ wazo-dev main" > /etc/apt/sources.list.d/wazo-dist.list
RUN wget http://mirror.wazo.community/xivo_current.key -O - | apt-key add -
RUN apt-get -q update && apt-get -q -y install \
    asterisk \
    xivo-libsccp

EXPOSE 2000 5038 5060/udp

CMD ["asterisk", "-dvf"]
