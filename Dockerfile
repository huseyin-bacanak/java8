# Base container with java 8 and common tools

# Pull base image.
FROM ubuntu:15.10

ENV DEBIAN_FRONTEND noninteractive

# Install Java.


#install java 8
RUN apt-get update \
    && apt-get install -y wget openssl ca-certificates \
    && cd /tmp \
    && wget -qO jdk8.tar.gz \
       --header "Cookie: oraclelicense=accept-securebackup-cookie" \
       http://download.oracle.com/otn-pub/java/jdk/8u40-b25/jdk-8u40-linux-x64.tar.gz \
    && tar xzf jdk8.tar.gz -C /opt \
    && mv /opt/jdk* /opt/java \
    && rm /tmp/jdk8.tar.gz \
    && update-alternatives --install /usr/bin/java java /opt/java/bin/java 100 \
    && update-alternatives --install /usr/bin/javac javac /opt/java/bin/javac 100

ENV JAVA_HOME /opt/java

# install common tools
RUN apt-get update && apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		wget \
		unzip \
		git \
	&& rm -rf /var/lib/apt/lists/*
