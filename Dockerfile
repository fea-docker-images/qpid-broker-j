FROM openjdk:8-jre-alpine

# prepare system
RUN apk add --no-cache bash

# env vars
ENV QPID_VERSION 7.1.1
ENV QPID_ARCHIVE apache-qpid-broker-j-${QPID_VERSION}-bin.tar.gz
ENV QPID_DOWNLOAD_URL https://www-eu.apache.org/dist/qpid/broker-j/${QPID_VERSION}/binaries/${QPID_ARCHIVE}
ENV QPID_INSTALL /usr/local
ENV INITIAL_CONFIG ${QPID_INSTALL}/initial-config.json
ENV QPID_HOME ${QPID_INSTALL}/qpid-broker/${QPID_VERSION}
ENV QPID_WORK /var/qpid-work

# download and install qpid broker-j
WORKDIR ${QPID_INSTALL}
RUN wget ${QPID_DOWNLOAD_URL}
RUN tar -xvf ${QPID_ARCHIVE}
RUN rm ${QPID_ARCHIVE}

# prepare work dir
COPY initial-config.json ${INITIAL_CONFIG}

# start qpid broker-j
ENTRYPOINT ${QPID_HOME}/bin/qpid-server --initial-config-path ${INITIAL_CONFIG}