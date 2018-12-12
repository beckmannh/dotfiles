#!/usr/bin/env bash

scr='/tmp/screenshot.png'
icon="$HOME/.config/i3/lock.png"
text="Senha: O barrigão do papai"

gradientColor='#282a36'

# take a screenshot
scrot "$scr"

# get gradient dimensions directly from the screenshot
read width height <<<$(file $scr | cut -d, -f 2 | tr -d ' ' | tr 'x' ' ')
height=$((height / 2))

convert "$scr" -scale 10% -scale 1000%\
	-size "${width}x${height}" -gravity south-west \
	gradient:none-"$gradientColor" -composite -matte \
	"$icon" -gravity center -composite -matte \
	-gravity center -pointsize 20 \
	-fill "#EAE4D1" -annotate +0+200 "$text" "$scr"
i3lock -i "$scr"
