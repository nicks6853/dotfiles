require("monokai-pro").setup({
    styles = {
        comment = { italic = true },
        parameter = { italic = true },
    },
    filter = "classic"
})

-- Set colorscheme
vim.cmd.colorscheme("monokai-pro")
