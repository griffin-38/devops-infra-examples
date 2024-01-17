FROM ubuntu:bionic

RUN apt-get -y update && \
  apt-get -y install git curl python3-pip && \
  curl -sSL https://get.docker.com/ | bash && \
  pip3 install awscli requests argh
