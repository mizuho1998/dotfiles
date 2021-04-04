#!/bin/bash
pkglist=(`cat vscode_settings/extensions.txt`)
for i in ${pkglist[@]}; do
    code --install-extension $i
done
