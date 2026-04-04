local registry = require("mason_list")
registry.add_lsp({
    "sqruff", -- For SQL
})

require("lint").linters_by_ft = {
    sql = { "sqruff" },
}

local syntax = require("treesitter_list")
syntax.add({
    "sql",
})
