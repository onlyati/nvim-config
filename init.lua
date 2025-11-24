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
