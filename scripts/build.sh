#! /bin/bash

set -eu

## git リポジトリ上の root のパスを取得
root_dir=$(readlink -f $(cd $(dirname $0) && cd .. && pwd))

## nginx のソースディレクトリ名の取得
nginx_src_dir=$(basename "$(ls -1vd ${root_dir}/nginx/nginx-*.tar.gz | tail -n 1)" .tar.gz);

## 依存するパッケージの解凍
env --chdir "${root_dir}/openssl" tar xvf openssl-1.1.1k.tar.gz;
env --chdir "${root_dir}/pcre"    tar xvf pcre-8.44.tar.gz;
env --chdir "${root_dir}/zlib"    tar xvf zlib-1.2.11.tar.gz;

## debian package のビルド
env --chdir "${root_dir}/nginx"   cp -r debian -t "${nginx_src_dir}";
echo "${root_dir}/nginx/${nginx_src_dir}"
env --chdir "${root_dir}/nginx/${nginx_src_dir}" fakeroot debian/rules clean -j"$(nproc)"
env --chdir "${root_dir}/nginx/${nginx_src_dir}" fakeroot debian/rules build -j"$(nproc)"
env --chdir "${root_dir}/nginx/${nginx_src_dir}" fakeroot debian/rules binary -j"$(nproc)"
