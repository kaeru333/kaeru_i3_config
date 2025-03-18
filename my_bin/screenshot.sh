#!/bin/bash
slop=$(slop -f "%g") || exit 1
read -r G < <(echo $slop)
# import -window root -crop $G ~/myimage.png
/home/linuxbrew/.linuxbrew/bin/import -window root -crop "$G" /home/yoshimi/Pictures/$(date +"%Y%m%d_%H%M%S").png

# importの実行結果を確認
if [ $? -ne 0 ]; then
    dunstify "Screenshot failed"
    exit 1
else
    dunstify "Screenshot saved to $screenshot_file"
fi
