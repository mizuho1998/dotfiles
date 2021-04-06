ZSHHOME="${HOME}/.zsh.d"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
    -x $ZSHHOME ]; then
    case `uname -a` in
        Darwin* )
            [[ -f "${ZSHHOME}/mac" ]] && source "${ZSHHOME}/mac"
            ;;
        Linux* )
            [[ -f "${ZSHHOME}/linux" ]] && source "${ZSHHOME}/linux"
            ;;
        MINGW* )
            ;;
    esac

    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh  ]] &&
        [ \( -f $i -o -h $i \) -a -r $i  ] && . $i
    done
fi

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
