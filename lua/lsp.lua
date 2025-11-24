vim.pack.add {
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
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

-- Setup LSP configs
vim.lsp.enable({
    "lua_ls",
    "gopls",
    "marksman",
    "yamlls",
})
