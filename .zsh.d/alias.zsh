case "${OSTYPE}" in
darwin*)
    alias ls="ls -G"
    alias ll="ls -lG"
    alias la="ls -laG"
    export LSCOLORS=gxfxcxdxbxegedabagacad # default: exfxcxdxbxegedabagacad
    ;;
linux*)
    alias ls='ls --color=auto'
    alias la='ls -a --color'
    alias ll='ls -l --color'
    alias lla='ls -al --color'
    alias open='nautilus'
    ;;
esac

alias ..='cd ..'
alias ...='cd ...'

