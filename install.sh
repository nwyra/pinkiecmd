#!/bin/bash
# install.sh — makes pinkify permanent by adding it to your shell config

PINK_LINE='echo -ne "\033]11;#F48FB1\007\033]10;#FCE4EC\007\033]12;#F8BBD0\007"'

# figure out which shell config file to use
if [ -n "$ZSH_VERSION" ] || [ "$(basename "$SHELL")" = "zsh" ]; then
    CONFIG_FILE="$HOME/.zshrc"
else
    CONFIG_FILE="$HOME/.bashrc"
fi

# avoid adding it twice
if grep -qF "$PINK_LINE" "$CONFIG_FILE" 2>/dev/null; then
    echo "pinkify is already installed in $CONFIG_FILE"
else
    echo "" >> "$CONFIG_FILE"
    echo "# pinkify — turns terminal pink on startup" >> "$CONFIG_FILE"
    echo "$PINK_LINE" >> "$CONFIG_FILE"
    echo "pinkify installed! Added to $CONFIG_FILE"
fi

echo "Restart your terminal (or run: source $CONFIG_FILE) to see it in pink."
