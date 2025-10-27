vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = {"*.ino", "*.cpp", "*.h" },
    callback = function()
        vim.cmd("Autoformat")
    end
})
