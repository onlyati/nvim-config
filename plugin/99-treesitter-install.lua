vim.schedule(function()
    local langs = {
        "bash",
        "c",
        "diff",
        "html",
        "css",
        "printf",
        "query",
        "regex",
        "toml",
        "vim", "vimdoc",
        "xml",
        "yaml",
    }
    local syntax = require("treesitter_list")
    syntax.add(langs) -- Default languages

    require('nvim-treesitter.install').install(syntax.get_lists(), {
        force = false,
    })

    -- For some language tree sitter must be started
    vim.api.nvim_create_autocmd("FileType", {
        pattern = syntax.get_lists(),
        callback = function(args)
            -- Run only once, register when treesitter started for buffer
            if vim.b[args.buf].ts_started then return end
            vim.b[args.buf].ts_started = true

            -- Schedule to avoid text lock
            vim.schedule(function()
                pcall(vim.treesitter.start, args.buf)
            end)
        end,
    })
end)
