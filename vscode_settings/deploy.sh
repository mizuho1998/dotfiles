#!/bin/bash

if [ "$(uname)" == 'Darwin' ]; then
    # OS='Mac'
    ln -s `pwd`"/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
    ln -s `pwd`"/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
    ln -s `pwd`"/snippets" "$HOME/Library/Application Support/Code/User/snippets"
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    # OS='Linux'
    ln -s `pwd`"/settings.json" "$HOME/.config/Code/User/settings.json"
    ln -s `pwd`"/keybindings.json" "$HOME/.config/Code/User/keybindings.json"
    ln -s `pwd`"/snippets" "$HOME/.config/Code/User/snippets"
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi
