# How to build

## prework

```bash
tar xvf nginx-*.tar.gz
cd nginx-*/
dh_make --createorig --single
```

## build!

```bash
bash all.sh
```

## その他

 -
 - [Manpages of debhelper in Debian testing — Debian Manpages](https://manpages.debian.org/testing/debhelper/index.html)
 - [Debian 管理者ハンドブック](https://debian-handbook.info/browse/ja-JP/stable/index.html)
   - [第 15 章 Debian パッケージの作成](https://debian-handbook.info/browse/ja-JP/stable/debian-packaging.html)
 - [Debian メンテナー用ガイド](https://www.debian.org/doc/manuals/debmake-doc/index.ja.html)
 - [社内利用のための deb パッケージング入門 - Cybozu Inside Out | サイボウズエンジニアのブログ](https://blog.cybozu.io/entry/2016/05/16/111500)
 - [Debian packaging with CDBS](https://debathena.mit.edu/packaging/)
 - [Ubuntu – disco の nginx パッケージに関する詳細](https://packages.ubuntu.com/disco/nginx)
