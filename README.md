
# Usage

set user info in .gitconfig.local,
then

1. `$ make github_ssh`

    add ssh public key (/HOME/.ssh/id_github_ras.pub) to github

1. `$ make github_check`

then,

- install [anyenv](https://github.com/anyenv/anyenv)
- install [nodenv](https://github.com/nodenv/nodenv) using anyenv
- install [goenv](https://github.com/syndbg/goenv) using anyenv

exec:

1. `$ make install`
1. `$ make deploy`

setting:
write your github information in `.gitconfig.local`
