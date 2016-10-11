FROM ubuntu:16.04
RUN apt-get update && apt-get install -y python-software-properties debconf-utils software-properties-common
# Oracle JDK
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get install -y oracle-java8-installer
# Maven
RUN apt-get install -y maven gnupg2
# NodeJS
RUN apt-get install -y curl && curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs
# Bower & Vulcanize
RUN npm install -g bower vulcanize
# Git
RUN apt-get install -y git
# Docker
RUN apt-get install -y iptables
RUN wget -O docker.deb https://apt.dockerproject.org/repo/pool/main/d/docker-engine/docker-engine_1.10.3-0~jessie_amd64.deb && dpkg -i docker.deb
RUN curl -L https://github.com/docker/compose/releases/download/1.8.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
