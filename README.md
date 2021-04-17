[![darwin](https://github.com/mizuho1998/dotfiles/actions/workflows/darwin.yaml/badge.svg?event=push)](https://github.com/mizuho1998/dotfiles/actions/workflows/darwin.yaml)
[![ubuntu](https://github.com/mizuho1998/dotfiles/actions/workflows/ubuntu.yaml/badge.svg)](https://github.com/mizuho1998/dotfiles/actions/workflows/ubuntu.yaml)

# Usage

exec:

1. `$ make install`
1. `$ make deploy`


### Github setting

1. `$ make github_ssh`

    add ssh public key (/HOME/.ssh/id_github_ras.pub) to github

1. `$ make github_check`

then,

- install [anyenv](https://github.com/anyenv/anyenv)
- install [nodenv](https://github.com/nodenv/nodenv) using anyenv
- install [goenv](https://github.com/syndbg/goenv) using anyenv

setting:
write your github information in `.gitconfig.local`


### vscode setting

```
$ cd vscode_settings
$ make restore-extensions
$ make deploy
```
