#!/bin/sh

set -e

echo "Configuring Git..."

# Create an SSH key for use with GitHub.
# https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

echo "Creating new SSH key..."

read -p "Enter GitHub email address: " EMAIL
ssh-keygen -t rsa -b 4096 -C "$EMAIL"

eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa

echo "You are not done setting up SSH for Git. You still need to add this key to your GitHub account."
echo "ZSH step will fail if you don't do this."
echo "See docs for adding SSH key to GitHub:"
echo "https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent"

cat > ~/.gitconfig << EOF
[user]
  name = Sherwood Callaway
  email = shcallaway@gmail.com
[url "git@github.com:"]
  insteadOf = https://github.com/
[blame]
  coloring = highlightRecent
EOF

echo "Done configuring Git!"

