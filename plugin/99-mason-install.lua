vim.pack.add {
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
}

vim.schedule(function()
    -- Install languager servers, modules, utilies, etc.
    require("mason").setup()
    local registry = require("mason_list")
    registry.add_tools({ "tree-sitter-cli" })
    local lsp, tools = registry.get_lists()

    -- This install the required server plus enable LSP config
    require("mason-lspconfig").setup({
        ensure_installed = lsp,
    })

    -- Install other tools like linter, formatter, DAP, etc.
    require('mason-tool-installer').setup({
        ensure_installed = tools,
    })
end)
