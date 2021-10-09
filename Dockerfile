
FROM jenkins/inbound-agent:alpine-jdk11

LABEL maintainer="Hexosse <hexosse@gmail.com>" \
    org.opencontainers.image.title="docker-suite dsuite/jenkins-agent image" \
    org.opencontainers.image.description="Jenkins agent with dind for dsuite/jenkins. For more info visit https://github.com/docker-suite/jenkins-setup" \
    org.opencontainers.image.authors="Hexosse <hexosse@gmail.com>" \
    org.opencontainers.image.vendor="docker-suite" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://github.com/docker-suite/jenkins-agent" \
    org.opencontainers.image.source="https://github.com/docker-suite/jenkins-agent" \
    org.opencontainers.image.documentation="https://github.com/docker-suite/jenkins-agent/blob/master/Readme.md"

## Switch to root user
USER root

## Install commonly used packages
RUN apk update \
    # Download the install-base script and run it
    && apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/  --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/ \
        make \
        docker-cli \
	# Clear apk's cache
	&& rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

# Do not go back to jenkins user when using the agent in from a docker in docker container
# USER jenkins
