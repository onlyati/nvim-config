---@type vim.lsp.Config
return {
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
}
