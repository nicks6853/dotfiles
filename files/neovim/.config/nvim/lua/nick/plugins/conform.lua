require("conform").setup({
    formatters_by_ft = {
        python = { "isort", "black" },
        javascript = { "eslint" },
        javascriptreact = { "eslint" },
        typescript = { "eslint" },
        typescriptreact = { "eslint" },
    }
})
