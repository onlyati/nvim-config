vim.pack.add {
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "main",
    },
    { src = "https://github.com/artemave/workspace-diagnostics.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
}

-- Treesitter config
require("nvim-treesitter").install({
    "go", "gomod", "gowork", "gosum",
    "bash",
    "c",
    "diff",
    "html",
    "css",
    "javascript", "jsdoc", "json", "jsonc",
    "vue",
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
    "ninja",
    "rst",
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'go' },
    callback = function() vim.treesitter.start() end,
})

-- Install languager servers, modules, utilies, etc.
require("mason").setup()

-- This install the required server plus enable LSP config
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "gopls",
        "marksman",
        "yamlls",
        "jsonls",
        "ruff",
        "basedpyright",
        "vtsls",
        "vue_ls",
    },
})

-- Install other tools like linter, formatter, DAP, etc.
require('mason-tool-installer').setup({
    ensure_installed = {
        "cspell",
        "delve",
        "gofumpt",
        "goimports",
        "golangci-lint",
        "gomodifytags",
        "gotestsum",
        "impl",
        "markdown-toc",
        "markdownlint-cli2",
        "pyright",
        "tree-sitter-cli",
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

        require("workspace-diagnostics").setup({
            workspace_files = function()
                local gitPath = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
                local workspace_files = vim.fn.split(vim.fn.system("git ls-files " .. gitPath), "\n")
                local filtered = {}
                for _, file in ipairs(workspace_files) do
                    if not file:match("^vendor/") and not file:match("^node_modules/") then
                        table.insert(filtered, file)
                    end
                end

                return filtered
            end,
        })
        require("workspace-diagnostics").setup()
        require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
    end,
})
