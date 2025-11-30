local start_time = vim.uv.hrtime()

require("options")
require("plugins")
require("lsp")
require("testing")
require("formatter")
require("keymap")

vim.pack.add({
    { src = "https://github.com/EdenEast/nightfox.nvim" },
})

require("nightfox").setup({
    palettes = {
        all = {
            comment = "#029105",
        },
    },
})

vim.cmd("colorscheme carbonfox")

-- Display startup time in milliseconds
local elapsed = (vim.uv.hrtime() - start_time) / 1e6
vim.notify("Neovim is ready to use under " .. elapsed .. "ms", vim.log.levels.INFO)
