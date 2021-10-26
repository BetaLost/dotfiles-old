#!/bin/bash

file=$(ls -1 $HOME/.config/awesome/themes/powerarrow/wallpapers/ | sort --random-sort | head -1)
feh --bg-scale $HOME/.config/awesome/themes/powerarrow/wallpapers/$file
wal -i $HOME/.config/awesome/themes/powerarrow/wallpapers/$file
cp $HOME/.cache/wal/colors.json $HOME/.config/awesome/themes/powerarrow/colors.json
