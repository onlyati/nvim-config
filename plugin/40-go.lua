vim.pack.add({
    -- DAP for Go
    { src = "https://github.com/leoluz/nvim-dap-go" },

    -- Neotest for Go
    { src = "https://github.com/fredrikaverpil/neotest-golang" }
})

-- Mason installer
local registry = require("mason_list")
registry.add_lsp({
    "gopls",            -- For Go
    "golangci_lint_ls", -- For Go lint
    "templ",            -- For Go template
})
registry.add_tools({
    "delve",            -- Go DAP
    "gofumpt",          -- Go format
    "goimports",        -- Go format
    "golangci-lint",    -- For Go lint
    "golangci_lint_ls", -- For Go lint
    "gomodifytags",     -- Go lint
    "gotestsum",        -- Go test
    "impl",             -- Go DAP
})

-- Treesitter queries
local syntax = require("treesitter_list")
syntax.add({
    "go",
    "gomod",
    "gowork",
    "gosum",
    "templ",
})

-- Initialize neotest-golang
require("neotest").setup({
    adapters = {
        require("neotest-golang")({
            testify_enabled = true,
            go_test_args = {
                "-v",
                "-race",
                "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
            },
            runner = "gotestsum",
        }),
    },
    status = { virtual_text = true },
    output = { open_on_run = true },
})

-- Keymaps
vim.keymap.set("n", "<leader>cgt", function() vim.cmd("W !templ generate") end, { desc = "Generate with templ" })
vim.keymap.set("n", "<leader>cgl",
    function() vim.cmd("W !golangci-lint run --max-same-issues 0 --max-issues-per-linter  0") end,
    { desc = "Run golangci-lint" })

-- Format on save and fetch modules
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        local params = vim.lsp.util.make_range_params(0, "utf-16")
        local req_params = {
            textDocument = params.textDocument,
            range = params.range,
            context = { only = { "source.organizeImports" } }
        }

        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", req_params, 1000)

        for client_id, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    local enc = (vim.lsp.get_client_by_id(client_id) or {}).offset_encoding or "utf-16"
                    vim.lsp.util.apply_workspace_edit(r.edit, enc)
                else
                    local client = vim.lsp.get_client_by_id(client_id)
                    if client then
                        client:request("workspace/executeCommand", r.command, function() end)
                    end
                end
            end
        end
        vim.lsp.buf.format({ async = false })
    end,
})

-- Setup LSP config
vim.lsp.config("gopls", {
    settings = {
        gopls = {
            gofumpt = true,
            codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
            },
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
            analyses = {
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            semanticTokens = true,
            linksInHover = true,
        },
    },
})
