vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.clue" },
    { src = "https://github.com/nvim-mini/mini.extra" },
})

require("mini.extra").setup({})
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
