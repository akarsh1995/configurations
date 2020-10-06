set nocompatible              " required
syntax enable

" show line numbers
set number

" set auto indent
set autoindent

" enable all Python syntax highlighting features
let python_highlight_all = 1

filetype off                  " required

filetype plugin indent on    " required
" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

set encoding=utf-8
set clipboard=unnamed
