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
Plug('nvim-treesitter/nvim-treesitter', {['branch'] = 'master'})

-- Install telescope for fuzzy search through files
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', {['tag'] = '0.1.8'})

-- Install lspconfig for easy language server configuration
Plug('neovim/nvim-lspconfig')

-- Install mason to easily install language servers for nvim-lspconfig
Plug('mason-org/mason.nvim')
-- Install mason-lspconfig to automatically install LSPs for ones enabled by nvim-lspconfig
Plug('mason-org/mason-lspconfig.nvim')

-- Install monokai neovim theme
Plug('tanvirtin/monokai.nvim')

-- Install amazon q
Plug('git@github.com:awslabs/amazonq.nvim.git')

-- Install harpoon to jump to files and required nvim-lua
-- Plug 'nvim-lua/plenary.nvim'
-- Plug 'ThePrimeagen/harpoon'

-- Add more plugins here as needed

vim.call('plug#end')

-- =====================
--  Add custom settings
-- =====================

require("nick")

