#!/bin/sh
# Crop a captured image with the landscape orientation of WeatherThanYesterday.

path="/home/sun/Downloads/"
file="*Yesterday.jpg"
convert $path$file -crop 1986x852+282+196 $path$file
nautilus $path
