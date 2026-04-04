vim.pack.add({
    { src = "https://github.com/smjonas/inc-rename.nvim" },
})

-- IncRename
require("inc_rename").setup({})
vim.keymap.set("n", "<leader>cr", function()
        local inc_rename = require("inc_rename")
        return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
    end,
    { expr = true, desc = "Rename" }
)
