-- =========================================
-- Install plugins
-- =========================================
local vim = vim
local Plug = vim.fn["plug#"]

-- Specify directory for plugins
vim.call("plug#begin", "~/.local/share/nvim/plugged")

-- Install formatting plugin
Plug("stevearc/conform.nvim")

-- Install linter plugin
Plug("mfussenegger/nvim-lint")

-- Install treesitter to parse code as code :)
Plug("nvim-treesitter/nvim-treesitter", { ["branch"] = "master" })

-- Install telescope for fuzzy search through files
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim", { ["tag"] = "0.1.8" })

-- Install lspconfig for easy language server configuration
Plug("neovim/nvim-lspconfig")

-- Install mason to easily install language servers for nvim-lspconfig
Plug("mason-org/mason.nvim")
-- Install mason-lspconfig to automatically install LSPs for ones enabled by nvim-lspconfig
Plug("mason-org/mason-lspconfig.nvim")

-- Install monokai neovim theme
Plug("tanvirtin/monokai.nvim")

-- Install amazon q
Plug("git@github.com:awslabs/amazonq.nvim.git")

-- Install Monokai Pro theme
Plug("loctvl842/monokai-pro.nvim")

-- Add more plugins here as needed

-- Local local-only Plug() calls that are in lua/local_cfg/plugins.lua if it exists
pcall(require, "local_cfg.plugins")

vim.call("plug#end")

-- =====================
--  Add custom settings
-- =====================

require("nick")
