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

vim.api.nvim_create_autocmd("VimEnter", {
    desc = "Close terminal and unnamed buffers on startup",
    callback = function()
        -- Try to load the project automatically
        vim.schedule(function()
            if vim.fn.argc() == 0 then
                local session_name = vim.fn.getcwd():gsub("/", "-")

                pcall(MiniSessions.read, session_name)
                for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                    if vim.api.nvim_buf_is_valid(buf) then
                        local bo = vim.bo[buf]
                        local buf_name = vim.api.nvim_buf_get_name(buf)

                        -- When minisession restore the terminal for some reason it
                        -- drops the terminal type but name of the buffer still
                        -- starts with term://
                        local is_terminal = bo.buftype == "terminal"
                            or string.match(buf_name, "^term://") ~= nil
                        local is_empty_unnamed = buf_name == ""
                            and bo.buftype == ""
                            and bo.filetype == ""
                            and not bo.modified


                        if is_terminal or is_empty_unnamed then
                            pcall(vim.api.nvim_buf_delete, buf, { force = true })
                        end
                    end
                end
                return
            end

            if vim.fn.argc() > 0 then
                local stat, err, rsn = vim.uv.fs_stat(vim.fn.argv(0))
                if err ~= nil then
                    vim.notify("failed to check arg[1]: " .. err .. " " .. rsn, vim.log.levels.ERROR)
                    return
                end
                if stat ~= nil and stat.type == "directory" then
                    MiniFiles.open()
                end
            end
        end)
    end,
})
