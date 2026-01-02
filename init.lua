local start_time = vim.uv.hrtime()

require("options")
require("plugins")
require("lsp")
require("testing")
require("formatter")
require("keymap")

-- vim.cmd("colorscheme carbonfox")
vim.cmd("colorscheme ati_dark")

-- Display startup time in milliseconds
local elapsed = (vim.uv.hrtime() - start_time) / 1e6
vim.notify("Neovim is ready to use under " .. elapsed .. "ms", vim.log.levels.INFO)
