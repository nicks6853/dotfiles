-- ========================================
-- Configure basic settings
-- ========================================

vim.opt.shiftwidth = 4      -- Set indent level to 4 spaces
vim.opt.tabstop = 4         -- Set tab to be 4 spaces
vim.opt.number = true       -- Enable line numbers
vim.opt.expandtab = true    -- Use spaces instead of tabs for indentation

vim.cmd([[syntax on]])

-- Set colorscheme
vim.cmd("colorscheme monokai")

-- Set the behaviour for the autocomplete popup
vim.cmd[[set completeopt+=menuone,noselect,popup]]

-- Set autoformat to true for the given file types
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = {"*.ino", "*.cpp", "*.h", "*.lua", "*.py" },
    callback = function()
        vim.cmd("Autoformat")
    end
})

-- Set .ino files to use cpp filetype
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.ino", "*.cpp", "*.h"},
    callback = function()
        vim.bo.filetype = "arduino"
    end,
})
