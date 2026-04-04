-- Generic vim.lsp related settigs
vim.pack.add {
    { src = "https://github.com/neovim/nvim-lspconfig" },
}

vim.lsp.inlay_hint.enable(true)

vim.api.nvim_create_user_command("LspInfo", function() vim.cmd("checkhealth vim.lsp") end, {})
vim.api.nvim_create_user_command("LspLog", function(_)
    local state_path = vim.fn.stdpath("state")
    local log_path = vim.fs.joinpath(state_path, "lsp.log")
    vim.cmd("edit " .. log_path)
end, {})
