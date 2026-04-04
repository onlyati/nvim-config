-- Contains those plugins that are just simple and used with default config.
vim.pack.add({
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-mini/mini.cmdline" },
    { src = "https://github.com/nvim-mini/mini.files" },
    { src = "https://github.com/nvim-mini/mini.icons" },
    { src = "https://github.com/nvim-mini/mini.notify" },
    { src = "https://github.com/nvim-mini/mini.snippets" },
    { src = "https://github.com/nvim-mini/mini.surround" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/windwp/nvim-ts-autotag" },
})

require("mini.cmdline").setup({})
require("mini.surround").setup({})
require("mini.files").setup({})
require("mini.notify").setup({})
require("mini.snippets").setup({})
require("nvim-ts-autotag").setup({})
require("gitsigns").setup()
require("mini.icons").setup({})
require("mini.icons").tweak_lsp_kind()

-- Keymaps
vim.keymap.set("n", "<leader>e", function() MiniFiles.open() end, { desc = "Open Explorer " })
vim.keymap.set("n", "<leader>H", function() MiniNotify.show_history() end, { desc = "Open history " })
