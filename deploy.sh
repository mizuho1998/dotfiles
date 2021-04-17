#!/bin/bash

if [ "$(uname)" == 'Darwin' ]; then
    echo 'Mac'
    ./mac/settings.sh --term-path ./mac
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    echo 'Linux'
    # Linuxディストリビューションごとの設定
    if [ -f "/etc/os-release" ]; then
        read line </etc/os-release && eval ${line}
        case ${NAME} in
        "CentOS Linux") ;;
        "Ubuntu") ;;
        *) ;;
        esac
    fi
fi


# ドットファイルのシンボリックリンクの作成
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".github" ]] && continue
    [[ "$f" == ".gitconfig.local.example" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -si `pwd`'/'$f ~/$f
 done
