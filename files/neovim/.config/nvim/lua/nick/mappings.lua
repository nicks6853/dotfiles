--  ====================
--  Custom Mappings
--  ====================

vim.g.mapleader = "\\"

-- Add mapping to search files with Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true, desc = "Open telescope to find files by name" })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true, desc = "Open telescope to find files by grep" })

-- Remap Ctrl+l and Ctrl+h to move between tabs
vim.keymap.set('n', '<C-l>', ':tabnext<CR>', { noremap = true, silent = true, desc = "Move to the next tab" })
vim.keymap.set('n', '<C-h>', ':tabprevious<CR>', { noremap = true, silent = true, desc = "Move to the previous tab" })

-- Add mapping to show LSP errors in a floating window
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { noremap = true, desc = "Open the error floating window from the LSP" })

-- Add mapping to copy to clipboard when in visual mode (block and line included)
vim.keymap.set('v', '<leader>c', '"+y', { noremap = true, desc = "Copy the selected content to the clipboard" })

-- Add mapping to switch between files in the quickfix list
vim.keymap.set('n', '<leader>n', ':cnext<CR>', { noremap = true, desc = "Go to the next quickfix file" })
vim.keymap.set('n', '<leader>p', ':cprev<CR>', { noremap = true, desc = "Go to the previous quickfix file" })

-- Open definition in a vertical split
vim.keymap.set('n', 'gsd', '<cmd>vsplit | lua vim.lsp.buf.definition()<CR>', { noremap = true, desc = 'Go to definition in vertical split' })

-- Run Autoformat on the current file
vim.keymap.set('n', '<leader>a', ':Autoformat<CR>', { noremap = true, desc = 'Run Autoformat on the current file' })

-- Add mapping for Amazon Q AI Agent
vim.keymap.set({'n', 'v'}, '<leader>q', ':<C-u>\'<,\'>AmazonQ<CR>', { noremap = true, desc = "Run AmazonQ command on selection or current line" })

-- Add mapping to go to next error in file
vim.keymap.set('n', '<leader>1', vim.diagnostic.goto_prev, { noremap = true, desc = "Go to previous error in file." })
vim.keymap.set('n', '<leader>2', vim.diagnostic.goto_next, { noremap = true, desc = "Go to next error in file." })


-- ==================================== NOTES ========================================
-- You can check the definition of a function or variable with "K"
-- ================================== END NOTES ======================================

-- Add mapping for Ctrl+Space to show the autocomplete box
vim.keymap.set('i', '<c-space>', function()
    vim.lsp.completion.get()
end)

