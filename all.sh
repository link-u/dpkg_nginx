#! /bin/bash

nginx_dir="$(ls -1vd nginx/*/ | sed 's/\/$//g' | tail -n 1)";

env --chdir openssl tar xvf openssl-1.0.2t.tar.gz
env --chdir pcre    tar xvf pcre-8.43.tar.gz
env --chdir zlib    tar xvf zlib-1.2.11.tar.gz
env --chdir "${nginx_dir}" dpkg-buildpackage -us -uc -j"$(nproc)"
