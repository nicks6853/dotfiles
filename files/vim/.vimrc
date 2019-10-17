set number

" tabstop:          Width of tab character
" softtabstop:      Fine tunes the amount of white space to be added
" shiftwidth        Determines the amount of whitespace to add in normal mode
" expandtab:        When on uses space instead of tabs
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab" tabstop:          Width of tab character

" let backspace erase old content in insert mode
set backspace=indent,eol,start

" set the theme
colorscheme default

" enable syntax highlighting
syntax on

" set yaml formatting for *.j2 files
au BufReadPost *.j2 set syntax=yaml
au BufReadPost *.sh set syntax=bash

