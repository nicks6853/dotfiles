-- vim.lsp.enable("arduino_ls")
vim.lsp.enable("arduino_language_server")
vim.lsp.enable("bashls")
vim.lsp.enable("basedpyright")
vim.lsp.enable("lua_ls")
vim.lsp.enable("eslint")
vim.lsp.enable("ts_ls")
vim.lsp.enable("clangd")
-- vim.ls.enable("ccls")
vim.lsp.enable("prettier")

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
        if client:supports_method('textDocument/completion') then
            -- Optional: trigger autocompletion on EVERY keypress. May be slow!
            -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            -- client.server_capabilities.completionProvider.triggerCharacters = chars

            vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
        end
    end
})

