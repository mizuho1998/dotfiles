#!/bin/bash
has() {
    type "$1" >/dev/null 2>&1
}

if ! has "brew"; then
    echo "installing homebrew..."
    which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

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
    iproute2mac
    gh
)

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
    #    rectangle
    #    alfred
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew install --cask $cask
done

brew cleanup

cat <<END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
