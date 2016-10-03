FROM airdock/oracle-jdk:1.8
# Maven
RUN apt-get update && apt-get install -y maven gnupg2
# NodeJS
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs
# Bower & Vulcanize
RUN npm install -g bower vulcanize
# Git
RUN apt-get install -y git
# Docker
ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 1.11.2
ENV DOCKER_SHA256 8c2e0c35e3cda11706f54b2d46c2521a6e9026a7b13c7d4b8ae1f3a706fc55e1
RUN set -x \
	&& curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
	&& echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - \
	&& tar -xzvf docker.tgz \
	&& mv docker/* /usr/local/bin/ \
	&& rmdir docker \
	&& rm docker.tgz \
	&& docker -v
ENV DOCKER_HOST='tcp://docker:2375'
#Docker Compose
RUN curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

