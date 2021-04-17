#!/bin/bash

formulas=(
    git
    tmux
    wget
    curl
    tree
    htop
    build-essential
    colordiff
    jq
    peco
    zsh
)

echo "install commands..."
for formula in "${formulas[@]}"; do
    sudo apt install -y $formula
done

# install gh
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
# sudo apt-get install dirmngr 
sudo apt install gh

# install zshrc
chsh -s $(which zsh)

cat <<END

**************************************************
INSTALLED! bye.
**************************************************

END
