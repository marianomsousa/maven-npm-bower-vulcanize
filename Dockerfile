FROM airdock/oracle-jdk:1.8
RUN apt-get update && apt-get install -y maven gnupg2
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs
RUN npm install -g bower vulcanize
RUN apt-get install -y git
RUN set -x \
	&& addgroup --system dockremap \
	&& adduser -system -group dockremap dockremap \
	&& echo 'dockremap:165536:65536' >> /etc/subuid \
	&& echo 'dockremap:165536:65536' >> /etc/subgid
ENV DIND_COMMIT 3b5fac462d21ca164b3778647420016315289034
RUN wget "https://raw.githubusercontent.com/docker/docker/${DIND_COMMIT}/hack/dind" -O /usr/local/bin/dind \
	&& chmod +x /usr/local/bin/dind
COPY dockerd-entrypoint.sh /usr/local/bin/
VOLUME /var/lib/docker
EXPOSE 2375
