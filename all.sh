#! /bin/bash

nginx_dir="nginx-1.17.5"

#tar xvf nginx-1.17.5.tar.gz
env --chdir openssl tar xvf openssl-1.0.2t.tar.gz
env --chdir pcre    tar xvf pcre-8.43.tar.gz
env --chdir zlib    tar xvf zlib-1.2.11.tar.gz
env --chdir nginx/${nginx_dir} dpkg-buildpackage -us -uc
