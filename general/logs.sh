#!/bin/sh
id="$1"
re="/home/sun/.pp/arch/log-fs.pv"
tmp="/home/sun/tmpre.txt"
sed -n "/$id/,/===/p" $re > $tmp &&
	cat $tmp | grep -e 'Specs' -B8 $tmp
rm $tmp

