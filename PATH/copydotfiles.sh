#!/bin/bash

# set -x

read -p 'Make sure you are in a directory such as ~/Dotfiles.
Proceed by pressing enter, cancel by pressing Ctrl-C '

# Remove everything except .git
ls -1A | grep -Gv ^\.git$ | while read line; do
    echo "Removing $line..."
    rm -rf $line
done

echo 'Linking...'

# Simple links
ln -f ~/.bashrc
ln -f ~/.profile
ln -f ~/colors.env
ln -f ~/commands.sh

# Recursive links
cp -lR ~/PATH .
cp -lR ~/Lemonbar .

# .config
mkdir .config
cp -lR ~/.config/nvim .config
cp -lR ~/.config/alacritty .config
cp -lR ~/.config/tmux .config
cp -lR ~/.config/dunst .config
cp -lR ~/.config/sway .config
cp -lR ~/.config/swayimg .config
cp -lR ~/.config/cava .config

echo 'Creating .gitignore...'

# Create .gitignore
touch .gitignore
echo __pycache__ > .gitignore
echo .config/cava/shaders >> .gitignore

echo Done!
