#! /bin/bash

# https://qiita.com/ymdymd/items/312c9f554d4ffb1f8dc6
JOBS=$[$(grep cpu.cores /proc/cpuinfo | sort -u | sed 's/[^0-9]//g') + 1]
make -j${JOBS}
