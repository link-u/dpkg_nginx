#! /bin/bash

set -eu

## git リポジトリ上の root のパスを取得
scripts_dir=$(dirname $0);

## deb ファイルのビルド
bash "${scripts_dir}/create_changelog.sh"
bash "${scripts_dir}/build.sh"
