-- =========================================
-- Install plugins
-- =========================================
local vim = vim
local Plug = vim.fn['plug#']

-- Specify directory for plugins
vim.call('plug#begin', "~/.local/share/nvim/plugged")

-- Add the vim-autoformat plugin
Plug('vim-autoformat/vim-autoformat')

-- Install treesitter to parse code as code :)
Plug('nvim-treesitter/nvim-treesitter', {['branch'] = 'main'})

-- Install telescope for fuzzy search through files
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', {['tag'] = '0.1.8'})

Plug('neovim/nvim-lspconfig')

-- Install harpoon to jump to files and required nvim-lua
-- Plug 'nvim-lua/plenary.nvim'
-- Plug 'ThePrimeagen/harpoon'

-- Add more plugins here as needed

vim.call('plug#end')

-- ========================================
-- Configure basic settings
-- ========================================

vim.opt.shiftwidth = 4      -- Set indent level to 4 spaces
vim.opt.tabstop = 4         -- Set tab to be 4 spaces
vim.opt.number = true       -- Enable line numbers
vim.opt.expandtab = true    -- Use spaces instead of tabs for indentation

vim.cmd([[syntax on]])

-- Set the behaviour for the autocomplete popup
vim.cmd[[set completeopt+=menuone,noselect,popup]]

-- ========================================
-- Import custom settings
-- ========================================

require("nick")
