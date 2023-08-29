FROM registry.suse.com/bci/bci-base:15.4

# nfs-client is needed by the dep https://github.com/longhorn/backupstore to check backup store availability.
RUN zypper -n rm container-suseconnect && \
    zypper -n install curl && \
    zypper -n clean -a && rm -rf /tmp/* /var/tmp/* /usr/share/doc/packages/*

WORKDIR /var/lib/coredhcp

ARG ARCH=amd64
ARG VERSION=dev
ENV COREDHCP_VERSION ${VERSION}
ENV TINI_VERSION v0.19.0
ENV TINI_URL_amd64=https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini \
    TINI_URL_arm64=https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-arm64 \
    TINI_URL_s390x=https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-s390x \
    TINI_URL=TINI_URL_${ARCH}

RUN curl -sLf ${!TINI_URL} > /usr/bin/tini && chmod +x /usr/bin/tini

COPY entrypoint.sh coredhcp /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

VOLUME /var/lib/coredhcp
ENTRYPOINT ["entrypoint.sh"]
