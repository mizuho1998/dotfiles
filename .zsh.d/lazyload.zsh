pyenv() {
  unfunction "$0"
  source <(pyenv init -)
  $0 "$@"
}

goenv() {
  unfunction "$0"
  source <(goenv init -)
  $0 "$@"
}

rbenv() {
  unfunction "$0"
  source <(rbenv init -)
  $0 "$@"
}

phpenv() {
  unfunction "$0"
  source <(phpenv init -)
  $0 "$@"
}

direnv() {
  unfunction "$0"
  source <(direnv hook zsh)
  $0 "$@"
}
