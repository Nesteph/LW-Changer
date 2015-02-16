#!/bin/sh

# Change to the url or local file you want to use
# Make sure to comment out the format not being used.

# Local file syntax
# imageURL="file:///path/to/local/image.png"

# Web based syntax
imageURL="https://mypuzzlingpiece.files.wordpress.com/2014/07/images-background-rainbow-spectrum.jpg"

curl -z /Library/Caches/com.apple.desktop.admin.png $imageURL > /Library/Caches/com.apple.desktop.admin.png