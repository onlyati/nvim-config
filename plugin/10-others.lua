vim.pack.add({
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
    { src = "https://github.com/smjonas/inc-rename.nvim" },
    { src = "https://github.com/windwp/nvim-ts-autotag" },
})

require("ibl").setup({
    indent = {
        char = "|",
        tab_char = "|",
    },
})
require("nvim-ts-autotag").setup({})
require("gitsigns").setup()

-- IncRename
require("inc_rename").setup({})
vim.keymap.set("n", "<leader>cr", function()
        local inc_rename = require("inc_rename")
        return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
    end,
    { expr = true, desc = "Rename" }
)
