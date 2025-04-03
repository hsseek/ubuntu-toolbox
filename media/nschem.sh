#!/bin/bash
# Capture chem-space.com workspace and negate the image.

current_time=$(date "+%Y-%m-%d-%H-%M-%S")
file="/home/sun/Pictures/Screenshots/chem-space-$current_time.png"
gnome-screenshot -f $file
convert $file -crop 526x376+498+416 $file
convert $file -transparent white -negate -resize x240\> $file
gimp $file
#gio trash $file
