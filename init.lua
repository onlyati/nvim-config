require("options")
require("lsp")
require("testing")
require("plugins")
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
