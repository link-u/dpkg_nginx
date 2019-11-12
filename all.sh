#! /bin/bash

nginx_dir="nginx-1.17.5"

env --chdir .            bash -eu 01-unpack.sh
env --chdir ${nginx_dir} bash ../02-configure.sh
env --chdir ${nginx_dir} bash ../03-make-deb.sh
