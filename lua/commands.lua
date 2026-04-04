-- Open command output in a float window
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
vim.api.nvim_create_user_command("LspLog", function(_)
    local state_path = vim.fn.stdpath("state")
    local log_path = vim.fs.joinpath(state_path, "lsp.log")
    vim.cmd(string.format("edit %s", log_path))
end, {})
vim.api.nvim_create_user_command("PackUpdate", function() vim.pack.update() end, {})

-- Override harpoon, open file with <s-L> instead of enter
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

-- Open harpoon if no file specified as parameter
vim.api.nvim_create_autocmd("VimEnter", {
    desc = "Open harpoon if no file specified as parameter",
    callback = function()
        vim.schedule(function()
            if vim.fn.argc() == 0 then
                local harpoon = require("harpoon")
                if #harpoon:list():display() > 0 then
                    harpoon.ui:toggle_quick_menu(harpoon:list(), {
                        border = "rounded",
                        title = "",
                    })
                end
            end
        end)
    end
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

-- Display help on vertical split buffer
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        if vim.bo.filetype == "help" then
            -- Check if the window is already at the far right.
            -- If not, move it there.
            if vim.fn.winlayout()[1] == "col" then
                vim.cmd("wincmd L")
                -- Optional: Set a comfortable width for reading
                vim.cmd("vertical resize 90")
            end
        end
    end,
})
