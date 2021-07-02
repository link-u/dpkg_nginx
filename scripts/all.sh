#! /bin/bash

set -eu

## git リポジトリ上の root のパスを取得
root_dir="$(cd "$(dirname "$(readlink -f "$0")")" && cd .. && pwd)"

cd "${root_dir}"

## ビルド時に必要なパッケージのインストール
env --chdir="${root_dir}/nginx" \
  mk-build-deps --install --remove \
  --tool='apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends --yes' \
  debian/control

## deb ファイルのビルド
bash "scripts/create_changelog.sh"
bash "scripts/build.sh"

