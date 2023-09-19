FROM fedora:latest

ARG VERSION
ARG USER
ARG PASS

ENV url="https://support.tail-f.com/delivery/download/confd/$VERSION/confd-$VERSION.linux.x86_64.signed.bin"

RUN dnf -y update && \
    dnf -y install curl openssh openssl openssl1.1 python python3-paramiko && \
    dnf clean all

WORKDIR /root

RUN curl -u $USER:$PASS -O $url && \
    sh confd-$VERSION.linux.x86_64.signed.bin && \
    sh confd-$VERSION.linux.x86_64.installer.bin confd-$VERSION