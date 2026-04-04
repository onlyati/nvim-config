require("lint").linters_by_ft = {
    dockerfile = { "hadolint" },
}

local registry = require("mason_list")
registry.add_lsp({
    "dockerls",
    "docker_compose_language_service",
})
registry.add_tools({
    "hadolint", -- Linter for Containerfiles
})

local syntax = require("treesitter_list")
syntax.add({
    "dockerfile",
})
