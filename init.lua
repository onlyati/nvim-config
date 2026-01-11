local start_time = vim.uv.hrtime()

-- Plugin setup
local plugins = {
    require("plugins"),   -- Simple plugins with minimal config
    require("lsp"),       -- Treesitter, mason and lsp config
    require("testing"),   -- DAP related config
    require("formatter"), -- Formatter settings
}

-- First install plugins, so when setup run it can assume that all plugins are available.
for _, p in ipairs(plugins) do
    p.install_plugins()
end
for _, p in ipairs(plugins) do
    p.setup()
end

-- Regular settings
require("options")
require("keymap")

vim.cmd("colorscheme ati_light")

-- Display startup time in milliseconds
local elapsed = (vim.uv.hrtime() - start_time) / 1e6
vim.notify("Neovim is ready to use under " .. elapsed .. "ms", vim.log.levels.INFO)
