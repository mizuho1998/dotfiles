#!/bin/bash

if [ "$(uname)" == 'Darwin' ]; then
    echo 'Mac'
    ./brew/install.sh
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    echo 'Linux'
    # Linuxディストリビューションごとの設定
    if [ -f "/etc/os-release" ]; then
        read line </etc/os-release && eval ${line}
        case ${NAME} in
        "CentOS Linux") ;;
        "Ubuntu")
            ./ubuntu/install.sh
            ;;
        *) ;;
        esac
    fi
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

# install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install anyenv
git clone https://github.com/anyenv/anyenv ~/.anyenv
~/.anyenv/bin/anyenv init
