FROM phusion/baseimage:0.9.11
MAINTAINER botez <troyolson1@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody


VOLUME /config
# install 64-bit binaries for ffmpeg/lame/etc
ADD http://madsonic.org/download/transcode/20140411_madsonic-transcode_latest_x64.zip /tmp/transcode.zip
RUN unzip /tmp/transcode.zip -d /tmp
RUN mv /tmp/linux/* /config
