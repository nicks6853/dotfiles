" Specify directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Add the vim-autoformat plugin
Plug 'vim-autoformat/vim-autoformat'

" Install telescope for fuzzy search through files
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.8'}

" Install harpoon to jump to files and required nvim-lua
" Plug 'nvim-lua/plenary.nvim'
" Plug 'ThePrimeagen/harpoon'

" Add more plugins here as needed

call plug#end()

" Set leader key to caps lock
let mapleader = "\\"

" Basic settings
set shiftwidth=4 " Set indent level to 4 spaces
set tabstop=4    " Set tab to be 4 spaces
set number       " Enable line numbers
set expandtab    " Use spaces instead of tabs for indentation

" Enable syntax highlighting
syntax enable


" Configure .ino files to be treated as cpp files
autocmd BufNewFile,BufRead *.ino set filetype=cpp

augroup autoformat_cpp
	autocmd!
	" Configure auto format on save for .ino files
	autocmd FileType cpp autocmd BufWritePre <buffer> Autoformat
augroup END

" Custom mappings - :GFiles is only files that are tracked by git. To search
" all files, change to :Files
" nnoremap <C-p> :GFiles<CR>
" Add mapping to search files with telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" Remap Ctrl + l and Ctrl + h to move between tabs
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>

" Theme configuration
colorscheme monokai

" Configure filetypes
autocmd BufNewFile,BufRead *.sh set filetype=bash
autocmd BufNewFile,BufRead *.md set syntax=markdown
