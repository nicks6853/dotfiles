require("conform").setup({
    formatters_by_ft = {
        sh = { "shfmt" },
        python = { "isort", "black" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
    formatters = {
        shfmt = {
            append_args = { "--indent", "2" }
        }
    }
})
