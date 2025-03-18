!bin/bash

export XMODIFIERS=@im=fcitx5
fcitx5 &
xkbcomp -I$HOME/.xkb ~/.xkb/keymap/mykbd $DISPLAY 2> /dev/null &
