# zplug
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# theme
# zplug mafredri/zsh-async, from:github
# zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
zplug mizuho1998/common, from:github, as:theme

# PROMPT変数内で変数参照する
setopt prompt_subst

# 構文のハイライト(https://github.com/zsh-users/zsh-syntax-highlighting)
zplug "zsh-users/zsh-syntax-highlighting", defer:2, lazy:true

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
zplug "zsh-users/zsh-history-substring-search", lazy:true
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


# clear

# if (which zprof > /dev/null 2>&1) ;then
#   zprof
# fi
