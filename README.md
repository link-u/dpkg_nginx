# Nginx automated builds

![Build debian packages](https://github.com/link-u/dpkg_nginx/workflows/Build%20debian%20packages/badge.svg)

## How to build manually

### clone git repository recursively.

```bash
git clone --recurse-submodules --recursive git@github.com:link-u/dpkg_nginx.git
bash scripts/all.sh
```

## Memo

### 最新の nginx に差し替えたい場合
以下から nginx のソースコードをダウンロードする.

- [Download Nginx tarball (source code)](http://nginx.org/en/download.html)

nginx-1.17.8 に差し替える例を示す.

```bash
wget http://nginx.org/download/nginx-1.17.8.tar.gz -P nginx/
env --chdir nginx tar xvf nginx-1.17.8.tar.gz
```

その後, 上記の方法でビルドする.


## その他

 - [Manpages of debhelper in Debian testing — Debian Manpages](https://manpages.debian.org/testing/debhelper/index.html)
 - [Debian 管理者ハンドブック](https://debian-handbook.info/browse/ja-JP/stable/index.html)
   - [第 15 章 Debian パッケージの作成](https://debian-handbook.info/browse/ja-JP/stable/debian-packaging.html)
 - [Debian メンテナー用ガイド](https://www.debian.org/doc/manuals/debmake-doc/index.ja.html)
 - [社内利用のための deb パッケージング入門 - Cybozu Inside Out | サイボウズエンジニアのブログ](https://blog.cybozu.io/entry/2016/05/16/111500)
 - [Debian packaging with CDBS](https://debathena.mit.edu/packaging/)
 - [Ubuntu – disco の nginx パッケージに関する詳細](https://packages.ubuntu.com/disco/nginx)
