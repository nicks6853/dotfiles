require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls", "pyright", "bashls", "eslint", "ts_ls",
    },
})
