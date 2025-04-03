#!/bin/bash
# Capture the pdf page and negate the image.

echo -n 'The SOLUTION page number to capture: '
read input
shift=8
page=$(($input+$shift))
current_time=$(date "+%Y-%m-%d-%H-%M-%S")
file="/home/sun/Pictures/Screenshots/org-$page-$current_time"
png="$file.png"

pdftoppm ~/Documents/변리사/2차/교재/유/Klein-4ed-solution.pdf $file -png -f $page -singlefile -r 400
convert $png -transparent white -negate $png
gimp $png
#gio trash $png
