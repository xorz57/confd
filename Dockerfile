FROM fedora:latest

ARG VERSION
ARG USER
ARG PASS

ENV url="https://support.tail-f.com/delivery/download/confd/$VERSION/confd-$VERSION.linux.x86_64.signed.bin"

WORKDIR /root

RUN dnf -y update && dnf -y install curl openssh openssl openssl1.1 python python3-paramiko
RUN curl -u $USER:$PASS -O $url
RUN sh confd-$VERSION.linux.x86_64.signed.bin
RUN sh confd-$VERSION.linux.x86_64.installer.bin ~/confd-$VERSION