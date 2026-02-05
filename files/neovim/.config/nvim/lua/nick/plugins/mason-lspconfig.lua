require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls", "basedpyright", "bashls", "eslint", "ts_ls"
    },
})
