local M = {}

function M.install_plugins()
    vim.pack.add({
        -- Dependency for DAP and Neotest
        { src = "https://github.com/nvim-neotest/nvim-nio" },

        -- DAP
        { src = "https://github.com/mfussenegger/nvim-dap" },
        { src = "https://github.com/rcarriga/nvim-dap-ui" },

        -- DAP for Go
        { src = "https://github.com/leoluz/nvim-dap-go" },

        -- Dependency of neotest and nvim-coverage (nvim-treesitter is added in lsp.lua)
        { src = "https://github.com/nvim-lua/plenary.nvim" },
        { src = "https://github.com/antoinemadec/FixCursorHold.nvim" },

        -- Neotest for Go
        { src = "https://github.com/nvim-neotest/neotest" },
        { src = "https://github.com/fredrikaverpil/neotest-golang" },

        -- Neovim coverage
        { src = "https://github.com/andythigpen/nvim-coverage" },
    })
end

function M.setup()
    require("dapui").setup()
    require("dap-go").setup()
    require("coverage").setup({
        auto_reload = true,
        highlights = {
            covered = { fg = "#1f6f43" },
            uncovered = { fg = "#b42318" },
            partial = { fg = "#7a5c00" },
        },
        signs = {
            covered = { hl = "CoverageCovered", text = "┃" },
            uncovered = { hl = "CoverageUncovered", text = "┃" },
            partial = { hl = "CoveragePartial", text = "┃" },
        },
    })

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
                go_test_args = {
                    "-v",
                    "-race",
                    "-count=1",
                    "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
                },
                runner = "gotestsum",
            })
        },
        status = { virtual_text = true },
        output = { open_on_run = true },
    })
end

return M
