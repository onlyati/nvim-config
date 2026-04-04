vim.pack.add({
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-mini/mini.cmdline" },
    { src = "https://github.com/nvim-mini/mini.completion" },
    { src = "https://github.com/nvim-mini/mini.files" },
    { src = "https://github.com/nvim-mini/mini.icons" },
    { src = "https://github.com/nvim-mini/mini.notify" },
    { src = "https://github.com/nvim-mini/mini.snippets" },
    { src = "https://github.com/nvim-mini/mini.surround" },
})

require("mini.cmdline").setup({})
require("mini.surround").setup({})
require("mini.files").setup({})
require("mini.icons").setup({})
require("mini.icons").tweak_lsp_kind()
require("mini.notify").setup({})
require("mini.snippets").setup({})
require("mini.completion").setup({
    lsp_completion = {
        source_func = 'omnifunc',
    },
})

-- Keymaps
vim.keymap.set("n", "<leader>e", function() MiniFiles.open() end, { desc = "Open Explorer " })
vim.keymap.set("n", "<leader>H", function() MiniNotify.show_history() end, { desc = "Open history " })
