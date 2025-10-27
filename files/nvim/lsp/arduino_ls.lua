-- Utility function to find the project root
local function find_project_root()
    local util = require("lspconfig.util")
    -- Search for .arduino-board first, then .git as fallback
    local root = util.root_pattern(".arduino-board")(vim.fn.getcwd())
    if not root then
        root = util.find_git_ancestor(vim.fn.getcwd())
    end
    return root or vim.fn.getcwd()  -- fallback to current working directory
end

-- Utility function to read the .arduino-board file
local function get_arduino_fqbn(root_dir)
    local board_file = root_dir .. "/.arduino-board"
    local file = io.open(board_file, "r")
    if not file then
        return nil
    end
    local fqbn = file:read("*l")  -- read first line
    file:close()
    return fqbn
end

local fqbn = get_arduino_fqbn(find_project_root())

return {
    name = "arduino-language-server",
    cmd = {
        "/home/nick/go/bin/arduino-language-server",
        "-cli", "/usr/local/bin/arduino-cli",
        "-cli-config", vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
        "-fqbn", fqbn,
        "-clangd", "/usr/bin/clangd",
    },
    root_markers = {
        ".clangd",
        ".clang-format",
        ".arduino-board",
    },
    filetypes = { "arduino", "ino", "cpp", "h" },
    capabilities = {
        textDocument = {
            semanticTokens = vim.NIL,
        },
        workspace = {
            semanticTokens = vim.NIL,
        },
    },
    on_attach = function(client, bufnr)
        print("attached")
        vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = false })
        vim.lsp.semantic_tokens.start(bufnr, client.id)
    end,
}
