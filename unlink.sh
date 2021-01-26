#!/bin/bash

# ドットファイルのシンボリックリンクの削除
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    if [ -e $HOME/"$f" ]; then
		unlink "$HOME/$f"
        echo "unlinked $HOME/$f"
    fi
 done
