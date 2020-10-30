##  build container ##
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

##  main container ##
FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
COPY --from=builder /tmp/nginx/*.deb /tmp/
RUN set -x \
    && addgroup --system --gid 101 nginx \
    && adduser --system --disabled-login --ingroup nginx --no-create-home --home /nonexistent --gecos "nginx user" --shell /bin/false --uid 101 nginx \
    && apt-get -y update \
    && apt-get install -y gettext libgd3 libgeoip1 libxml2 libxslt1.1 \
    && apt-get install -y /tmp/*.deb && rm /tmp/*.deb
COPY "./docker/entrypoint.sh" "/entrypoint.sh"
COPY "./docker/resolver.conf" "/resolver.conf.template"
RUN chmod a+x "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
