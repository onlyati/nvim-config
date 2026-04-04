local registry = require("mason_list")
registry.add_lsp({
    "vtsls",
    "vue_ls",
})

local syntax = require("treesitter_list")
syntax.add({
    "javascript",
    "jsdoc",
    "vue",
    "tsx",
    "typescript",
    "html",
    "css",
    "regex",
})
