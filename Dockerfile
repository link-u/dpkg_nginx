FROM ubuntu:latest as builder
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /tmp/
COPY . .
COPY .git/ ./.git/

RUN apt-get -y update \
    && apt-get install -y --no-install-recommends \
                       build-essential debhelper devscripts debmake equivs \
                       lsb-release git bash \
    && bash scripts/all.sh

FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /tmp

COPY --from=builder /tmp/*.deb .

RUN ls -alh

RUN apt-get install -y /tmp/*.deb

WORKDIR /
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
