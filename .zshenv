# zmodload zsh/zprof && zprof

if [ -z $ZSH_ENV_LOADED ]; then
    export ZSH_ENV_LOADED="1"

    if [ -z $TMUX ]; then
        if [ -n "$HOME/.anyenv/bin" ]; then
            export PATH="$HOME/.anyenv/bin:$PATH"
            eval "$(anyenv init -)"
        fi
        if [ -n "$PYENV_ROOT" ]; then
            eval "$(pyenv init -)"
        fi
        if [ -n "$GOPATH" ]; then
            # GO_VERSION=`goenv version | sed -e 's/\([0-9]*.[0-9]*.[0-9]*\)\(.*\)/\1/'`
            # export PATH="$HOME/go/$GO_VERSION/bin:$PATH"
            export PATH=$PATH:$GOPATH/bin;
        fi

        if [ -n "$HOME/.cargo/bin" ]; then
            export PATH="$HOME/.cargo/bin:$PATH"
            source $HOME/.cargo/env
        fi

        export PATH="$HOME/.local/bin:$PATH"
        export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
    fi
else
    echo "skep loading .zshenv\n"
fi
