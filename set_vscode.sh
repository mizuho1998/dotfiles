#!/bin/bash

if [ "$(uname)" == 'Darwin' ]; then
    # OS='Mac'
    ln -s `pwd`"/vscode_settings/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
    ln -s `pwd`"/vscode_settings/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
    ln -s `pwd`"/vscode_settings/snippets" "$HOME/Library/Application Support/Code/User/snippets"
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    # OS='Linux'
    ln -s `pwd`"/vscode_settings/settings.json" "$HOME/.config/Code/User/settings.json"
    ln -s `pwd`"/vscode_settings/keybindings.json" "$HOME/.config/Code/User/keybindings.json"
    ln -s `pwd`"/vscode_settings/snippets" "$HOME/.config/Code/User/snippets"
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi
