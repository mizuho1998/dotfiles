#!/bin/bash

# install zshrc
sudo apt install zsh
chsh -s $(which zsh)

# install zplug
$ curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


if [ "$(uname)" == 'Darwin' ]; then
    # OS='Mac'
    echo 'Mac'
    # homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    # OS='Linux'
    echo 'Linux'
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi
