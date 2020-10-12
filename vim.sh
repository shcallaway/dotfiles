#!/bin/sh

set -e

echo "Configuring Vim..."

cat > ~/.vimrc << EOF
syntax on

set smartindent
set tabstop=2 shiftwidth=2 expandtab
set number

colo pablo
EOF

echo "Done configuring Vim!"

