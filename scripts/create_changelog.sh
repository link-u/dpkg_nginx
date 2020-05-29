#! /bin/bash

set -eu

## git リポジトリ上の root のパスを取得
root_dir=$(env --chdir "$(dirname $0)/.." pwd)

## HEAD のコミットID と HEAD の時のタグを取得
git_commit="$(git rev-parse HEAD)"
git_ref="$(git tag --points-at ${git_commit})"

## changelog の作成
cp "${root_dir}/scripts/changelog_template" "${root_dir}/nginx/debian/changelog"
env --chdir "${root_dir}/nginx/debian" sed -i -r "s/%DATE%/$(LC_ALL=C TZ=JST-9 date '+%a, %d %b %Y %H:%M:%S %z')/g" changelog
if [ "${git_ref:0:1}" = "v" ]; then
  env --chdir "${root_dir}/nginx/debian" sed -i -r "s/X.Y.Z-alpha/${git_ref:1}.$(TZ=JST-9 date +%Y%m%d)/g" changelog
else
  ## nginx のソースディレクトリ名の取得 (バージョン名の取得のため)
  nginx_src_dir=$(basename "$(ls -1vd ${root_dir}/nginx/nginx-*.tar.gz | tail -n 1)" .tar.gz);
  env --chdir "${root_dir}/nginx/debian" sed -i -r "s/X.Y.Z-alpha/${nginx_src_dir:6}-$(TZ=JST-9 date +%Y%m%d.%H%M%S).${git_commit:0:7}/g" changelog
fi
