#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."
brew upgrade --all

formulas=(
    git
    tmux
    wget
    curl
    tree
    htop
    colordiff
    jq
    # zsh
    peco
    ghq
    hub
    cask
    anyenv
    iproute2mac
)

"brew tap..."

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
#    google-chrome
#    google-japanese-ime
#    firefox
#    slack
#    discord
#    iterm2
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew cask install $cask
done

brew cleanup
brew cask cleanup

cat <<END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
