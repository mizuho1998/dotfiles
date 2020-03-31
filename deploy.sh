#!/bin/bash

# ドットファイルのシンボリックリンクの作成
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    if [ -e $HOME/"$f" ]; then
        echo "$HOME/$f already exists!"
    else
        ln -s `pwd`'/'$f ~
        echo "$f"
    fi
 done
