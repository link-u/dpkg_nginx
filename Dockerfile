FROM ubuntu:latest as builder
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /tmp
COPY . .

RUN ls -alh

RUN apt-get -y update &&\
    apt-get install -y --no-install-recommends build-essential debhelper devscripts debmake equivs && \
    apt-get install -y --no-install-recommends lsb-release git bash

RUN bash scripts/all.sh

FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /

COPY --from=builder /tmp/*.deb .

RUN apt-get install -y *.deb

ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
