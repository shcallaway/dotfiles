syntax on
set smartindent
set tabstop=2 shiftwidth=2 expandtab
set number

" FZF
set rtp+=/usr/local/opt/fzf

" Golint
" set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
" autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ayu-theme/ayu-vim'

call plug#end()

set termguicolors
let ayucolor="dark"
colorscheme ayu

