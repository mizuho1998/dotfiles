#!/bin/bash

if [ "$(uname)" == 'Darwin' ]; then
    # OS='Mac'
    rm "$HOME/Library/Application Support/Code/User/settings.json" ;\
    rm "$HOME/Library/Application Support/Code/User/keybindings.json" ;\
    rm -r "$HOME/Library/Application Support/Code/User/snippets"
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    # OS='Linux'
    rm "$HOME/.config/Code/User/settings.json" ;\
    rm "$HOME/.config/Code/User/keybindings.json" ;\
    rm -r "$HOME/.config/Code/User/snippets"
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

rm -r "$HOME/.vsnip/snippets";
