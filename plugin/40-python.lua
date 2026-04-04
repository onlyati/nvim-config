local registry = require("mason_list")
registry.add_lsp({
    "ruff",
    "basedpyright",
})
registry.add_tools({
    "pyright", -- Python linter
})

local syntax = require("treesitter_list")
syntax.add({
    "python",
    "rst",
    "ninja",
    "toml",
})
