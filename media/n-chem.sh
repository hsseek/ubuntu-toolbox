#!/bin/bash
# Capture screen and negate the image.

gnome-screenshot -a -f ~/Pictures/img.png
convert ~/Pictures/img.png -negate ~/Pictures/img.png
gimp ~/Pictures/img.png
gio trash ~/Pictures/img.png

#for file in ~/Pictures/*.png; do
#    convert "$file" -negate "$file"
#    gimp "$file"
#    gio trash "$file" 
#done
