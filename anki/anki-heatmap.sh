#!/bin/sh
# Capture the Heatmap region from Anki window with full screen.

current_time=$(date "+%Y-%m-%d-%H-%M-%S")
file="/home/sun/heatmap-$current_time.png"
gnome-screenshot -f $file
convert $file -crop 700x410+616+176 $file
