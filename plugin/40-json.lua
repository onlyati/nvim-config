local registry = require("mason_list")
registry.add_lsp({
    "jsonls", -- For JSON
})

local syntax = require("treesitter_list")
syntax.add({
    "json",
})
