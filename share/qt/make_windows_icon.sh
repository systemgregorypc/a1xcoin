#!/bin/bash
# create multiresolution windows icon
ICON_SRC=../../src/qt/res/icons/a1xcoin.png
ICON_DST=../../src/qt/res/icons/a1xcoin.ico
convert ${ICON_SRC} -resize 16x16 a1xcoin-16.png
convert ${ICON_SRC} -resize 32x32 a1xcoin-32.png
convert ${ICON_SRC} -resize 48x48 a1xcoin-48.png
convert a1xcoin-48.png a1xcoin-32.png a1xcoin-16.png ${ICON_DST}
