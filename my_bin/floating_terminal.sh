# Alacrittyが起動しているか確認
is_alacritty_running=$(pgrep -x alacritty)

# Alacrittyが起動していればフォーカス、起動していなければ起動
if [ -n "$is_alacritty_running" ]; then
    # Alacrittyがすでに起動していれば、フォーカスを移す
    i3-msg '[class="Alacritty"] move workspace current, focus'
else
    # Alacrittyが起動していなければ、新たに起動する
    alacritty&
fi

