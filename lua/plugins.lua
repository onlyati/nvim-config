vim.pack.add({
    { src = "https://github.com/akinsho/bufferline.nvim" },
    { src = "https://github.com/folke/persistence.nvim" },
    { src = "https://github.com/folke/snacks.nvim" },
    { src = "https://github.com/folke/which-key.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/nvim-mini/mini.completion" },
    { src = "https://github.com/nvim-mini/mini.hipatterns" },
    { src = "https://github.com/nvim-mini/mini.icons" },
    { src = "https://github.com/nvim-mini/mini.pairs" },
    { src = "https://github.com/nvim-mini/mini.snippets" },
    { src = "https://github.com/nvim-mini/mini.surround" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/smjonas/inc-rename.nvim" },
    { src = "https://github.com/windwp/nvim-ts-autotag" },
})

require("mini.icons").setup({})
require("snacks").setup({
    picker = {
        enabled = true,
        sources = {
            explorer = {},
        },
    },
    indent = {
        enabled = true,
        animate = {
            enabled = false,
        },
    },
    notifier = { enabled = true },
    explorer = { enabled = true },
})
require("bufferline").setup({})
require("mini.surround").setup({})
require("mini.hipatterns").setup({})
require("mini.pairs").setup({})
require("mini.snippets").setup({})
require("mini.completion").setup({})
require("inc_rename").setup({})
require("nvim-ts-autotag").setup({})
require("lualine").setup({})
require("persistence").setup()
require("gitsigns").setup()

-- vim.pack.add({
--     { src = "https://github.com/onlyati/quadlet-lsp.nvim" },
-- })
-- require("quadlet-lsp").setup()

vim.pack.add({
    { src = "/home/ati/work/quadlet-lsp.nvim" },
})
require("quadlet-lsp").setup({
    cmd = "/home/ati/work/quadlet-lsp/bin/quadlet-lsp",
})
