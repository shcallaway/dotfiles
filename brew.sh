#!/bin/sh

set -e

echo "Running Homebrew..."

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brewfile is a nice way to declaritively install things w/ Homebrew.
# https://github.com/Homebrew/homebrew-bundle
cat > ~/Brewfile << EOF
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/core"

brew "aws-iam-authenticator"
brew "awscli"
brew "bash"
brew "bash-completion@2"
brew "bat"
brew "docker"
brew "docker-compose"
brew "fzf"
brew "git"
brew "jq"
brew "kubectx"
brew "kubernetes-helm"
brew "node"
brew "postgresql"
brew "rename"
brew "ripgrep"
brew "ruby"
brew "stern"
brew "terraform"

cask "superhuman"
cask "1password"
cask "alfred"
cask "docker"
cask "firefox"
cask "sublime-text"
cask "zoomus"
cask "iterm2"
cask "little-snitch"
cask "moom"
cask "slack"
cask "spotify"
cask "visual-studio-code"
EOF

brew bundle --file ~/Brewfile
rm ~/Brewfile
rm ~/Brewfile.lock.json

echo "Done running Homebrew!"

