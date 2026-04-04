vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.statusline" },
})

local function get_macro_status()
    local recording_register = vim.fn.reg_recording()
    if recording_register == "" then
        return ""
    end
    return "󰑊 Recording @" .. recording_register
end

require('mini.statusline').setup({
    content = {
        active = function()
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local git           = MiniStatusline.section_git({ trunc_width = 75 })
            local diag          = MiniStatusline.section_diagnostics({ trunc_width = 75 })
            local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
            local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
            local location      = MiniStatusline.section_location({ trunc_width = 75 })

            -- Call our macro function
            local macro         = get_macro_status()

            return MiniStatusline.combine_groups({
                { hl = mode_hl,                     strings = { mode } },
                { hl = 'MiniStatuslineDevinfo',     strings = { git, diag } },
                { hl = 'MiniStatuslineModeReplace', strings = { macro } },
                '%<',
                { hl = 'MiniStatuslineFilename', strings = { filename } },
                '%=',
                { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                { hl = mode_hl,                  strings = { location } },
            })
        end
    }
})
