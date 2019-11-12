#! /bin/bash

echo "次のファイルが削除されます："
echo
git clean -fdx -n | sed -e 's/^/>\ /'
echo
yn="N"
while true
do
	read -p "ほんとに消す？[yN]" yn
	case $yn in
		([Yy]*) break ;;
		([Nn]*) exit 0 ;;
		(*)  ;;
	esac
done
echo
git clean -fdx | sed -e 's/^/>\ /'
echo

