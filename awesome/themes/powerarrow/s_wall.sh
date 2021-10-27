#!/bin/bash

# Set random wallpaper
theme_dir="$HOME/.config/awesome/themes/powerarrow"
rofi_theme="$HOME/.config/rofi/theme.rasi"

rm $theme_dir/theme.lua

file=$(ls -1 $theme_dir/wallpapers/ | sort --random-sort | head -1)
feh --bg-scale $theme_dir/wallpapers/$file

# Generate colorscheme
wal -i $theme_dir/wallpapers/$file
cp $HOME/.cache/wal/colors.json $theme_dir/colors.json
cp $theme_dir/theme.lua.base $theme_dir/theme.lua 

get_color() {
	color=$(jq .colors.color$1 $theme_dir/colors.json)
	if [[ $2 == "rofi" ]]; then
	    nq_color=$(echo $color | tr -d '"')
	    sed -i "s/c$1/$nq_color/g" $rofi_theme
	else
	    sed -i "s/c$1/$color/g" $theme_dir/theme.lua
	fi
}

get_color 1
get_color 2
get_color 3
get_color 4
get_color 5
get_color 6

rm $rofi_theme
cp "$rofi_theme.base" $rofi_theme
get_color 1 rofi

rm $theme_dir/colors.json
