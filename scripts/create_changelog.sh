#! /bin/bash

set -eu

## git リポジトリ上の root のパスを取得
root_dir=$(env --chdir "$(dirname $0)/.." pwd)

## nginx のソースディレクトリ名の取得 (バージョン名の取得のため)
nginx_src_dir=$(basename "$(ls -1vd ${root_dir}/nginx/nginx-*.tar.gz | tail -n 1)" .tar.gz);

## changelog の作成
cp "${root_dir}/scripts/changelog_template" "${root_dir}/nginx/debian/changelog"
env --chdir "${root_dir}/nginx/debian" sed -i -r "s/X.Y.Z/${nginx_src_dir:6}/g" changelog
env --chdir "${root_dir}/nginx/debian" sed -i "s/%DATE%/$(LC_ALL=C TZ=JST-9 date '+%a, %d %b %Y %H:%M:%S %z')/g" changelog
