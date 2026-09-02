#!/bin/bash
pink='echo -ne "\033]11;#F48FB1\007\033]10;#FCE4EC\007\033]12;#F8BBD0\007"'
if [ -n "$ZSH_VERSION" ] || [ "$(basename "$SHELL")" = "zsh" ]; then
    conf="$HOME/.zshrc"
else
    conf="$HOME/.bashrc"
fi
if grep -qF "$pink" "$conf" 2>/dev/null; then
    echo "pinkiecmd is already installed in $conf"
else
    echo "" >> "$conf"
    echo "# pinkiecmd turns terminal pink" >> "$conf"
    echo "$pink" >> "$conf"
    echo "pinkiecmd installed, added to $conf"
fi
echo "run: source $conf to see it in pink"
