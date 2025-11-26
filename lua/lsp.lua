vim.pack.add {
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter",    version = "main" },
    { src = "https://github.com/artemave/workspace-diagnostics.nvim" },
}

-- Treesitter config
require("nvim-treesitter").install({
    "go", "gomod", "gowork", "gosum",
    "bash",
    "c",
    "diff",
    "html",
    "javascript", "jsdoc", "json", "jsonc",
    "lua", "luadoc", "luap",
    "markdown", "markdown_inline",
    "printf",
    "python",
    "query",
    "regex",
    "toml",
    "tsx",
    "typescript",
    "vim", "vimdoc",
    "xml",
    "yaml",
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'go' },
    callback = function() vim.treesitter.start() end,
})

-- Install language servers
require("mason").setup({
    auto_install = true,
    ensure_installed = {
        "gofumt", "gopls", "goimports", "delve", "gotestsum", "gomodifytags", "impl", "golangci-lint",
        "markdown-toc", "markdownlint-cli2",
        "lua-language-server",
    },
})

-- Send all workspace data to the languager server
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
            return
        end
        local bufnr = args.buf

        if client.name == "gopls" then
            require("workspace-diagnostics").setup({
                workspace_files = function()
                    local gitPath = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
                    local workspace_files = vim.fn.split(vim.fn.system("git ls-files " .. gitPath), "\n")
                    local filtered = {}
                    for _, file in ipairs(workspace_files) do
                        if not file:match("^vendor/") then
                            table.insert(filtered, file)
                        end
                    end

                    return filtered
                end,
            })
        else
            require("workspace-diagnostics").setup()
        end
        require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
    end,
})

-- Setup LSP configs
vim.lsp.enable({
    "lua_ls",
    "gopls",
    "marksman",
    "yamlls",
})
