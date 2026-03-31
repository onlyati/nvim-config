vim.api.nvim_create_user_command('W', function(ctx)
    local lines = vim.fn.split(vim.api.nvim_exec2(ctx.args, { output = true }).output, '\n')

    -- Calculate dimensions (80% of screen)
    local width = math.ceil(vim.o.columns * 0.6)
    local height = math.ceil(vim.o.lines * 0.6)
    local row = math.ceil((vim.o.lines - height) / 2)
    local col = math.ceil((vim.o.columns - width) / 2)

    -- Create scratch buffer
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    -- Open the float
    local _ = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        row = row,
        col = col,
        style = 'minimal',
        border = 'rounded'
    })

    -- Close the float with 'q'
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = buf, silent = true })
end, { nargs = '+', complete = 'command' })

vim.api.nvim_create_user_command("LspInfo", function() vim.cmd(":checkhealth vim.lsp") end, {})
vim.api.nvim_create_user_command("PackUpdate", function() vim.pack.update() end, {})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "harpoon",
    callback = function(opts)
        -- Map Shift+L ('L') to act exactly like the Enter key (<CR>)
        vim.keymap.set("n", "L", "<CR>", {
            buffer = opts.buf,
            remap = true,
            desc = "Open Harpoon File"
        })
    end,
})
