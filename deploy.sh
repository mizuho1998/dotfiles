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

[[ ! -e $HOME/.vim ]] && mkdir $HOME/.vim

if [ -e "$HOME/.vim/coc-settings.json" ]; then
    echo "$HOME/.vim/coc-settings.json already exists!"
else
    ln -s `pwd`'/coc-settings.json' $HOME/.vim/coc-settings.json
fi
