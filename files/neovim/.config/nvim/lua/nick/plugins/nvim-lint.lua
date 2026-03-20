local lint = require("lint")

lint.linters_by_ft = {
    python = { "pylint" }
}

lint.linters.pylint.cmd = function()
    local venv_bin = vim.fn.findfile(".venv/bin/pylint", '.;')
    if venv_bin ~= "" then
        return venv_bin
    end
    return "pylint"
end


-- Auto cmd to run lint on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        require("lint").try_lint()
    end,
})
