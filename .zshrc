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

# anyenv path
if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    for D in `\ls $HOME/.anyenv/envs`
    do
        export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
    done
fi
if [ -n "$GOPATH" ]; then
    # GO_VERSION=`goenv version | sed -e 's/\([0-9]*.[0-9]*.[0-9]*\)\(.*\)/\1/'`
    # export PATH="$HOME/go/$GO_VERSION/bin:$PATH"
    export PATH=$PATH:$GOPATH/bin;
fi


if [ -e "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
    source $HOME/.cargo/env
fi
