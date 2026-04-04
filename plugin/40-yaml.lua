local registry = require("mason_list")
registry.add_lsp({
    "yamlls", -- For YAML
})

vim.lsp.config("yamlls", {
    settings = {
        yaml = {
            schemas = {
                [vim.fn.stdpath("config") .. "/yaml-schemas/openapi.json"] = "openapi.yaml",
            },
            validate = true,
            hover = true,
            completion = true,
            format = true,
        }
    }
})

local syntax = require("treesitter_list")
syntax.add({
    "yaml",
})
