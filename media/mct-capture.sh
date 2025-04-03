#!/bin/bash
# Capture the pdf page and negate the image.

echo -n 'The TEXT page number to capture: '
read input
shift=0
page=$(($input+$shift))
current_time=$(date "+%Y-%m-%d-%H-%M-%S")
file="/home/sun/Pictures/Screenshots/org-$page-$current_time"
png="$file.png"

pdftoppm ~/Documents/변리사/2차/교재/유/2023-가농.pdf $file -png -f $page -singlefile -r 400
convert $png -transparent 'rgb(254,254,254)' -negate $png
gimp $png
# gio trash $png

