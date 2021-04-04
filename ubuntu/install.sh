#!/bin/bash

formulas=(
    git
    wget
    curl
    tree
    htop
    colordiff
    jq
    peco
    zsh
)

echo "install commands..."
for formula in "${formulas[@]}"; do
    apt install -y $formula
done

# install zshrc
chsh -s $(which zsh)

cat <<END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
