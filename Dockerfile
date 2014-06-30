FROM phusion/baseimage:0.9.11
MAINTAINER botez <troyolson1@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody


VOLUME /config

ADD Makefile /tmp/Makefile
#RUN mkdir -p /config/transcode
#RUN mv /tmp/Makefile /config/transcode/

RUN mkdir /etc/service/test
ADD test.sh /etc/service/test/run
RUN chmod +x /etc/service/test/run

CMD ["/sbin/my_init"]
