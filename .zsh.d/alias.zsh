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

alias grep='grep --color=auto'

alias ..='cd ..'
alias ...='cd ...'

# git
alias ga='git add'
alias gap='git add -p'
alias gd='git diff'
alias gdc='git diff --cached'
alias gs='git status'
#alias gp='git push'
alias gb='git branch'
alias gco='git checkout'
alias gf='git fetch'
alias gc='git commit -m'

# カレントディレクトリのパスをクリップボードにコピー
alias pwdc='pwd | tr -d "\n" | pbcopy'
