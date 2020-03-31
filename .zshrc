# zplug
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# theme
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
autoload -U promptinit; promptinit
zstyle ':prompt:pure:path' color cyan

# PROMPT変数内で変数参照する
setopt prompt_subst
# プロンプトが使用可能になった(前の処理が終わった)時間の表示
RPROMPT="%F{white} %D{%m/%d %H:%M:%S} %f"

# 構文のハイライト(https://github.com/zsh-users/zsh-syntax-highlighting)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# タイプ補完
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
# 補完の可視化
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
# ミスタイプ時に似たコマンドの提案
setopt correct

# history関係
zplug "zsh-users/zsh-history-substring-search"
# create history file
HISTFILE=$HOME/.zsh-history
HISTSIZE=10000
SAVEHIST=100000
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
# 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# ビープ音をオフにする
setopt no_beep
setopt nolistbeep

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
# Then, source plugins and add commands to $PATH
zplug load


alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'

alias platex='docker run --rm -v $PWD:/work -w=/work mizuhof/texubuntu platex'
alias dvipdfmx='docker run --rm -v $PWD:/work -w=/work mizuhof/texubuntu dvipdfmx'

alias allping='echo 10.30.81.{1..254} | xargs -P256 -n1 ping -s1 -c1 -W1 | grep ttl'
alias allping_home='echo 192.168.26.{1..254} | xargs -P256 -n1 ping -s1 -c1 -W3 | grep ttl'


export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
eval "$(pyenv init -)"

# goenv
# GO_VERSION=`goenv version | sed -e 's/\([0-9]*.[0-9]*.[0-9]*\)\(.*\)/\1/'`
# export PATH="$HOME/go/$GO_VERSION/bin:$PATH"


case `uname -a` in
    Darwin* )
        [[ -f "${HOME}/.zshrc.mac" ]] && source "${HOME}/.zshrc.mac"
        ;;
    Linux* )
        [[ -f "${HOME}/.zshrc.linux" ]] && source "${HOME}/.zshrc.linux"
        ;;
    MINGW* )
        ;;
esac

clear
