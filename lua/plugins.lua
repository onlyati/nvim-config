local M = {}

function M.install_plugins()
    vim.pack.add({
        { src = "https://github.com/folke/persistence.nvim" },
        { src = "https://github.com/folke/snacks.nvim" },
        { src = "https://github.com/lewis6991/gitsigns.nvim" },
        { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
        { src = "https://github.com/stevearc/oil.nvim" },
        { src = "https://github.com/nvim-mini/mini.cmdline" },
        { src = "https://github.com/nvim-mini/mini.completion" },
        { src = "https://github.com/nvim-mini/mini.clue" },
        { src = "https://github.com/nvim-mini/mini.extra" },
        { src = "https://github.com/nvim-mini/mini.pick" },
        { src = "https://github.com/nvim-mini/mini.hipatterns" },
        { src = "https://github.com/nvim-mini/mini.icons" },
        { src = "https://github.com/nvim-mini/mini.snippets" },
        { src = "https://github.com/nvim-mini/mini.statusline" },
        { src = "https://github.com/nvim-mini/mini.surround" },
        { src = "https://github.com/nvim-mini/mini.tabline" },
        { src = "https://github.com/nvim-tree/nvim-web-devicons" },
        { src = "https://github.com/smjonas/inc-rename.nvim" },
        { src = "https://github.com/windwp/nvim-ts-autotag" },
    })
end

function M.setup()
    require("snacks").setup({
        picker = {
            enabled = true,
        },
        indent = {
            enabled = true,
            animate = {
                enabled = false,
            },
        },
        notifier = { enabled = true },
    })
    require("mini.cmdline").setup({})
    require("mini.surround").setup({})
    require("mini.hipatterns").setup({})
    require("mini.pick").setup({})
    require("mini.extra").setup({})
    require("mini.icons").setup({})
    require("mini.snippets").setup({})
    require("mini.statusline").setup({})
    require("mini.completion").setup({})
    require("mini.tabline").setup({})
    require("inc_rename").setup({})
    require("nvim-ts-autotag").setup({})
    require("persistence").setup()
    require("gitsigns").setup()
    require("oil").setup({
        view_options = {
            show_hidden = true,
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
            { mode = "n", keys = "<leader>c", desc = "+Code" },
            { mode = "n", keys = "<leader>s", desc = "+Search" },
            { mode = "n", keys = "<leader>b", desc = "+Buffer" },
            { mode = "n", keys = "<leader>g", desc = "+Go to" },
            { mode = "n", keys = "<leader>d", desc = "+Debug" },
            { mode = "n", keys = "<leader>t", desc = "+Testing" },
            { mode = "n", keys = "<leader>q", desc = "+Session" },
        },

        window = {
            delay = 100,
        },
    })

    vim.pack.add({
        { src = "https://github.com/onlyati/quadlet-lsp.nvim" },
    })
    require("quadlet-lsp").setup()

    -- vim.pack.add({
    --     { src = "/home/ati/work/quadlet-lsp.nvim" },
    -- })
    -- require("quadlet-lsp").setup({
    --     cmd = "/home/ati/work/quadlet-lsp/bin/quadlet-lsp",
    -- })
end

return M
