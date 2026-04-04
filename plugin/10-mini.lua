vim.pack.add({
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-mini/mini.cmdline" },
    { src = "https://github.com/nvim-mini/mini.completion" },
    { src = "https://github.com/nvim-mini/mini.clue" },
    { src = "https://github.com/nvim-mini/mini.extra" },
    { src = "https://github.com/nvim-mini/mini.files" },
    { src = "https://github.com/nvim-mini/mini.pick" },
    { src = "https://github.com/nvim-mini/mini.hipatterns" },
    { src = "https://github.com/nvim-mini/mini.icons" },
    { src = "https://github.com/nvim-mini/mini.notify" },
    { src = "https://github.com/nvim-mini/mini.snippets" },
    { src = "https://github.com/nvim-mini/mini.statusline" },
    { src = "https://github.com/nvim-mini/mini.surround" },
})

require("mini.cmdline").setup({})
require("mini.surround").setup({})

local hipatterns = require('mini.hipatterns')
hipatterns.setup({
    highlighters = {
        hex_color = hipatterns.gen_highlighter.hex_color({
            style = "inline",
            inline_text = "██ ",
        }),
    },
})

require("mini.pick").setup({})
require("mini.extra").setup({})
require("mini.files").setup({})
require("mini.icons").setup({})
require("mini.icons").tweak_lsp_kind()
require("mini.notify").setup({})
require("mini.snippets").setup({})
require("mini.statusline").setup({})
require("mini.completion").setup({
    lsp_completion = {
        source_func = 'omnifunc',
    },
})
local miniclue = require("mini.clue")
miniclue.setup({
    triggers = {
        { mode = { "n", "x" }, keys = "<Leader>" },
        { mode = "n",          keys = "[" },
        { mode = "n",          keys = "]" },
        { mode = "i",          keys = "<C-x>" },
        { mode = { "n", "x" }, keys = "g" },
        { mode = { "n", "x" }, keys = "\"" },
        { mode = { "n", "x" }, keys = "`" },
        { mode = { "n", "x" }, keys = "\"" },
        { mode = { "i", "c" }, keys = "<C-r>" },
        { mode = "n",          keys = "<C-w>" },
        { mode = { "n", "x" }, keys = "z" },
    },

    clues = {
        miniclue.gen_clues.square_brackets(),
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
        { mode = "n", keys = "<leader>c",  desc = "+Code" },
        { mode = "n", keys = "<leader>b",  desc = "+Buffer" },
        { mode = "n", keys = "<leader>cg", desc = "+Go" },
        { mode = "n", keys = "<leader>cc", desc = "+Coverage" },
        { mode = "n", keys = "<leader>d",  desc = "+Debug" },
        { mode = "n", keys = "<leader>f",  desc = "+Finders" },
        { mode = "n", keys = "<leader>g",  desc = "+Go to" },
        { mode = "n", keys = "<leader>h",  desc = "+Harpoon" },
        { mode = "n", keys = "<leader>s",  desc = "+Search" },
        { mode = "n", keys = "<leader>t",  desc = "+Testing" },
        { mode = "n", keys = "<leader>q",  desc = "+Session" },
    },

    window = {
        delay = 100,
    },
})


-- Go to keys
vim.keymap.set("n", "gd", ":Pick lsp scope='definition'<CR>", { desc = "Go to definition" })
vim.keymap.set("n", "grr", ":Pick lsp scope='references'<CR>", { desc = "Go to references" })
vim.keymap.set("n", "<leader>gd", ":Pick lsp scope='definition'<CR>", { desc = "Go to definition" })
vim.keymap.set("n", "<leader>gr", ":Pick lsp scope='references'<CR>", { desc = "Go to references" })

-- Search functions
vim.keymap.set("n", "<leader><space>", ":Pick files<CR>", { desc = "Files search" })
vim.keymap.set("n", "<leader>sf", ":Pick files<CR>", { desc = "Files search" })
vim.keymap.set("n", "<leader>sb", ":Pick buffers<CR>", { desc = "Buffer search" })
vim.keymap.set("n", "<leader>sg", ":Pick grep_live<CR>", { desc = "Grep search" })
vim.keymap.set("n", "<leader>s\"", ":Pick registers<CR>", { desc = "Register search" })
vim.keymap.set("n", "<leader>sa", ":Pick commands<CR>", { desc = "Auto commands search" })
vim.keymap.set("n", "<leader>sd", ":Pick diagnostic<CR>", { desc = "Diagnostics search" })

-- Other keys
vim.keymap.set("n", "<leader>e", function() MiniFiles.open() end, { desc = "Open Explorer " })
vim.keymap.set("n", "<leader>H", function() MiniNotify.show_history() end, { desc = "Open history " })
