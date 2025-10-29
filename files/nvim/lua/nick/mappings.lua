--  ====================
--  Custom Mappings
--  ====================

vim.g.mapleader = "\\"

-- Add mapping to search files with Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })

-- Remap Ctrl+l and Ctrl+h to move between tabs
vim.keymap.set('n', '<C-l>', ':tabnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', ':tabprevious<CR>', { noremap = true, silent = true })

-- Add mapping to show LSP errors in a floating window
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { noremap = true })

-- Add mapping to copy to clipboard when in visual mode (block and line included)
vim.keymap.set('v', '<leader>c', '"+y', { noremap = true })

-- Add mapping to switch between files in the quickfix list
vim.keymap.set('n', '<leader>n', ':cnext<CR>', { noremap = true })
vim.keymap.set('n', '<leader>p', ':cprev<CR>', { noremap = true })


-- Add mapping for Ctrl+Space to show the autocomplete box
vim.keymap.set('i', '<c-space>', function()
    vim.lsp.completion.get()
end)

