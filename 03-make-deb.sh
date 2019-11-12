yes "" | sudo -k checkinstall \
  --type="debian" \
  --install=no \
  --pkgname=nginx \
  --pkglicense="BSD-2-Clause" \
  --pkggroup="Link-U" \
  --pkgsource="https://github.com/nginx/nginx" \
  --maintainer="ryo.hirafuji@link-u.co.jp" \
  --pkgarch=$(dpkg --print-architecture) \
  --requires="libxml2 \(\>= 2.9.4\), libxslt1.1 \(\>= 1.1.29\), libgd3 \(\>= 2.2.5\), libgeoip1 \(\>= 1.6.12-1\), libc6 \(\>= 2.27\)" \
    make install

dpkg-buildpackage -us -uc

