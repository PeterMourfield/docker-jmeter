FROM ubuntu:latest

ENV JMETER_VERSION 5.1.1
ENV JMETER_HOME /usr/local/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN $JMETER_HOME/bin

RUN  apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    ca-certificates -y \
    && update-ca-certificates \
    && apt-get install  -y --no-install-recommends \
        openjdk-8-jre-headless \
        curl \
        zip \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /tmp/dependencies \
    && curl -L https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz >  /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz \
    && tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /usr/local \
    && rm -rf /tmp/dependencies

ENV PATH $PATH:${JMETER_BIN}

WORKDIR	${JMETER_HOME}

COPY startup.sh /

ENTRYPOINT ["/startup.sh"]