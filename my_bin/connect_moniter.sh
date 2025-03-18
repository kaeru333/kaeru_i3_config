#!/bin/bash

# HDMI-A-0 が接続されているか確認する
if xrandr | grep -q "^HDMI-A-0 connected"; then
    # 接続されている場合はモニターを設定
    # xrandr --output HDMI-A-0 --mode 1920x1080 --above eDP
    xrandr --output HDMI-A-0 --mode 1920x1080 --right-of eDP
    # コマンドの終了ステータスをチェック
    if [ $? -eq 0 ]; then
        # コマンドが成功した場合に通知を送信
        dunstify "Success" "HDMI-A-0 set to 1920x1080 on the above of eDP" -a "MonitorSetup" -u normal
        # DISPLAY=:0.1 feh --no-xinerma --bg-scale /home/yoshimi/myfiles/os/desktop/wallpaper/快晴OrangeSter_1920x1080.png
        # DISPLAY=:0.0 feh --no-xinerma --bg-scale /home/yoshimi/myfiles/os/desktop/wallpaper/快晴OrangeSter_waifu2x_art_noise1_scale.png
    else
        # コマンドが失敗した場合にエラーメッセージを通知
        dunstify "Error" "Failed to set HDMI-A-0" -a "MonitorSetup" -u critical
    fi
else
    # HDMI-A-0 が接続されていない場合にエラーメッセージを通知
    dunstify "Error" "HDMI-A-0 is not connected" -a "MonitorSetup" -u critical
fi
