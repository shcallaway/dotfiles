syntax on
set smartindent
set tabstop=2 shiftwidth=2 expandtab
set number

" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'andreypopp/vim-colors-plain'

call plug#end()

set termguicolors
colorscheme plain

" Don't be a bum - lose the arrow keys
noremap  <Up> ""
noremap  <Down> ""
noremap  <Left> ""
noremap  <Right> ""

