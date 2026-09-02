#!/bin/bash
if [ -n "$ZSH_VERSION" ] || [ "$(basename "$SHELL")" = "zsh" ]; then
    conf="$HOME/.zshrc"
else
    conf="$HOME/.bashrc"
fi
if ! grep -q "pinkiecmd turns terminal pink" "$conf" 2>/dev/null; then
    echo "pinkify isn't installed in $conf"
    exit 0
fi
sed -i.bak '/# pinkiecmd turns terminal pink/{N;/echo -ne/d}' "$conf"
echo "pinkiecmd removed from $conf"
echo "A backup of the old file was saved as ${conf}.bak"
echo "run: source $conf for the change"
