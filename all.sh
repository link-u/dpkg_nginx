#! /bin/bash

## nginx のソースディレクトリ名の取得
nginx_src_dir=$(basename "$(ls -1vd nginx/nginx-*.tar.gz | tail -n 1)" .tar.gz);

## 依存するパッケージの解凍
env --chdir openssl tar xvf openssl-1.0.2t.tar.gz;
env --chdir pcre    tar xvf pcre-8.43.tar.gz;
env --chdir zlib    tar xvf zlib-1.2.11.tar.gz;

## debian package のビルド
env --chdir nginx   cp -r debian -t "${nginx_src_dir}";
env --chdir "nginx/${nginx_src_dir}" dh_make --single --createorig --yes;
env --chdir "nginx/${nginx_src_dir}" dpkg-buildpackage -us -uc -j"$(nproc)";
