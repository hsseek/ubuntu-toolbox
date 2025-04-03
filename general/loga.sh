#!/bin/sh
clear
id="$1"
option="$2"
re="/home/sun/.pp/arch/log-re.pv"
tmp="/home/sun/tmpre.txt"
sed -n "/$id/,/===/p" $re > $tmp &&
sed -i '/ignored.*/d' $tmp

if [ -z "$option" ]; then 
	head -n 1 $tmp 
	# Remove titles: <This is a title>  .
	sed -i 's#<\S.*>\s*##g' $tmp &&
	# Remove the links.
	sed -i 's#\s*https://freethread.net/caution/[0-9]*##' $tmp &&
	# Remove the separators.
	sed -i '/======/d' $tmp && sed -i '/------/d' $tmp
	# Print the result and remove the temporary file.
	cat $tmp && rm $tmp
elif [ $option = 'd' ]; then
	# Detailed logs without removing repetitive information
	cat $tmp && rm $tmp
else
	echo "Unexpected option: $option"
fi

