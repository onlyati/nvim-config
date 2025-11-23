vim.pack.add({
    -- Dependency for DAP and Neotest
    { src = "https://github.com/nvim-neotest/nvim-nio" },

    -- DAP
    { src = "https://github.com/mfussenegger/nvim-dap" },
    { src = "https://github.com/rcarriga/nvim-dap-ui" },

    -- DAP for Go
    { src = "https://github.com/leoluz/nvim-dap-go" },

    -- Dependency of neotest (nvim-treesitter is added in lsp.lua)
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/antoinemadec/FixCursorHold.nvim" },

    -- Neotest for Go
    { src = "https://github.com/nvim-neotest/neotest" },
    { src = "https://github.com/fredrikaverpil/neotest-golang" },
})

require("dapui").setup()
require("dap-go").setup()

-- Configure Neotest
local neotest_ns = vim.api.nvim_create_namespace("neotest")
vim.diagnostic.config({
    virtual_text = {
        format = function(diagnostic)
            local message =
                diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
        end,
    },
}, neotest_ns)

require("neotest").setup({
    adapters = {
        require("neotest-golang")({
            testify_enabled = true,
        })
    },
    status = { virtual_text = true },
    output = { open_on_run = true },
})
