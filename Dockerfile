FROM openjdk:17-jdk-slim

MAINTAINER Rafał Laskowski <rafal.laskowski@outlook.com>

# Install curl and unzip
RUN apt-get update && \
    apt-get install -y curl unzip

# Install Maven
ARG MAVEN_VERSION=3.8.4
ARG MAVEN_HOME=/opt/maven
RUN curl -fsSL https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz | tar -xzC /opt && \
    ln -s /opt/apache-maven-${MAVEN_VERSION} ${MAVEN_HOME} && \
    ln -s ${MAVEN_HOME}/bin/mvn /usr/local/bin/mvn

ENV M2_HOME=${MAVEN_HOME}
ENV MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=512m"
ENV PATH=${MAVEN_HOME}/bin:${PATH}

# Install AWS CLI v2
RUN curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws
