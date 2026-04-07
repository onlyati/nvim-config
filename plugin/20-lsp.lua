-- Generic vim.lsp related settigs
vim.pack.add {
    { src = "https://github.com/neovim/nvim-lspconfig" },
}

vim.lsp.inlay_hint.enable(true)
vim.lsp.codelens.enable(true)
vim.lsp.inline_completion.enable(true)

-- Commands that used to exists and I just got used to it
vim.api.nvim_create_user_command("LspInfo", function() vim.cmd("checkhealth vim.lsp") end, {})
vim.api.nvim_create_user_command("LspLog", function(_)
    local state_path = vim.fn.stdpath("state")
    local log_path = vim.fs.joinpath(state_path, "lsp.log")
    vim.cmd("edit " .. log_path)
end, {})

-- Set width for hover text
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local opts = { buffer = args.buf }

        vim.keymap.set('n', 'K', function()
            vim.lsp.buf.hover({
                border = 'rounded',
                max_width = 100,
                focusable = true,
            })
        end, opts)
    end,
})

-- Show nice progress
vim.api.nvim_create_autocmd('LspProgress', {
    callback = function(ev)
        local value = ev.data.params.value
        vim.api.nvim_echo({ { value.message or 'done' } }, false, {
            id = 'lsp.' .. ev.data.client_id,
            kind = 'progress',
            source = 'vim.lsp',
            title = value.title,
            status = value.kind ~= 'end' and 'running' or 'success',
            percent = value.percentage,
        })
    end,
})
