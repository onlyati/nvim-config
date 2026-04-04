vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.hipatterns" },
})

local hipatterns = require('mini.hipatterns')
hipatterns.setup({
    highlighters = {
        hex_color = hipatterns.gen_highlighter.hex_color({
            style = "inline",
            inline_text = "██ ",
        }),
    },
})
