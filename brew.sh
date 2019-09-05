#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install \
    slack \
    alfred \
    moom \
    spotify \
    iterm2 \
    firefox \
    1password \
    visual-studio-code \
    little-snitch \
    docker \
    dash

brew install \
    bash \
    fzf \
    bat \
    node \
    python \
    ruby \
    jq \
    bash-completion@2 \
    git \
    rename \
    terraform \
    awscli \
    aws-iam-authenticator \
    kubectx \
    kubernetes-cli \
    kubernetes-helm \
    derailed/k9s/k9s \
    stern
