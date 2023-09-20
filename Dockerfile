FROM ubuntu:jammy

ARG TAILF_USERNAME
ARG TAILF_PASSWORD
ARG CONFD_VERSION

ENV CONFD_URL="https://support.tail-f.com/delivery/download/confd/$CONFD_VERSION/confd-$CONFD_VERSION.linux.x86_64.signed.bin"

RUN apt update -y && \
    apt install -y curl openssh-client openssh-server openssl python3 python3-paramiko

WORKDIR /root

RUN curl -u $TAILF_USERNAME:$TAILF_PASSWORD -O $CONFD_URL && \
    sh confd-$CONFD_VERSION.linux.x86_64.signed.bin && \
    sh confd-$CONFD_VERSION.linux.x86_64.installer.bin confd-$CONFD_VERSION && \
    echo ". ~/confd-$CONFD_VERSION/confdrc" >> .bashrc