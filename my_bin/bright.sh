#!/bin/bash

STEP=5   # 明るさの増減ステップ（%）

# 現在の明るさを取得（パーセンテージ表示）
CurrBright=$(brightnessctl g)  # Get current brightness level
MaxBright=$(brightnessctl m)   # Get maximum brightness level

# パーセンテージでの現在の明るさを計算
CurrBrightPercent=$(( CurrBright * 100 / MaxBright ))

# 増減方向に応じて新しい明るさを計算
if [[ "$1" == "Up" || "$1" == "+" ]]; then
    NewBrightPercent=$(( CurrBrightPercent + STEP ))
elif [[ "$1" == "Down" || "$1" == "-" ]]; then
    NewBrightPercent=$(( CurrBrightPercent - STEP ))
else
    echo "Usage: $0 [Up|+|Down|-]"
    exit 1
fi

# 明るさが0～100%の範囲内に収まるように制限
if (( NewBrightPercent > 100 )); then
    NewBrightPercent=100
elif (( NewBrightPercent < 1 )); then
    NewBrightPercent=1
fi

# 新しい明るさを適用
brightnessctl set "${NewBrightPercent}%"

# 現在の明るさを表示
echo "Current Brightness: ${NewBrightPercent}%"
