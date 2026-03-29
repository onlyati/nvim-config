local M = {}

function M.install_plugins()
    vim.pack.add {
        { src = "https://github.com/neovim/nvim-lspconfig" },
        { src = "https://github.com/mason-org/mason.nvim" },
        {
            src = "https://github.com/nvim-treesitter/nvim-treesitter",
            version = "main",
        },
        { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
        { src = "https://github.com/artemave/workspace-diagnostics.nvim" },
        { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
        { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
    }
end

function M.setup()
    -- Treesitter config
    require("nvim-treesitter").install({
        "go", "gomod", "gowork", "gosum", "templ",
        "bash",
        "c",
        "diff",
        "html",
        "css",
        "javascript", "jsdoc", "json",
        "vue",
        "lua", "luadoc", "luap",
        "markdown", "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim", "vimdoc",
        "xml",
        "yaml",
        "ninja",
        "rst",
        "dockerfile",
        "sql",
    })

    -- For some language tree sitter must be started
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "go", "markdown", "templ" },
        callback = function(args)
            -- Run only once, register when treesitter started for buffer
            if vim.b[args.buf].ts_started then return end
            vim.b[args.buf].ts_started = true

            -- Schedule to avoid text lock
            vim.schedule(function()
                pcall(vim.treesitter.start, args.buf)
            end)
        end,
    })

    -- If treesitter updated, execute TSUpdate
    vim.api.nvim_create_autocmd('PackChanged', {
        callback = function(ev)
            local name, kind = ev.data.spec.name, ev.data.kind
            if name == 'nvim-treesitter' and kind == 'update' then
                if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
                vim.cmd('TSUpdate')
            end
        end
    })

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

    require('treesitter-context').setup()

    -- Install languager servers, modules, utilies, etc.
    require("mason").setup()

    -- This install the required server plus enable LSP config
    require("mason-lspconfig").setup({
        ensure_installed = {
            "lua_ls",           -- For Lua
            "gopls",            -- For Go
            "golangci_lint_ls", -- For Go lint
            "templ",            -- For Go template
            "marksman",         -- For markdown
            "yamlls",           -- For YAML
            "jsonls",           -- For JSON
            "sqruff",           -- For SQL

            -- For python
            "ruff",
            "basedpyright",

            -- For Vuejs
            "vtsls",
            "vue_ls",

            -- For Containerfiles and docker-compose
            "dockerls",
            "docker_compose_language_service",
        },
    })

    -- Install other tools like linter, formatter, DAP, etc.
    require('mason-tool-installer').setup({
        ensure_installed = {
            "tree-sitter-cli",   -- Tree sitter for highlights
            "cspell",            -- Spell check
            "delve",             -- Go DAP
            "gofumpt",           -- Go format
            "goimports",         -- Go format
            "golangci-lint",     -- For Go lint
            "golangci_lint_ls",  -- For Go lint
            "gomodifytags",      -- Go lint
            "gotestsum",         -- Go test
            "impl",              -- Go DAP
            "markdown-toc",      -- Markdown table of content generator
            "markdownlint-cli2", -- Markdown linter
            "pyright",           -- Python linter
            "hadolint",          -- Linter for Containerfiles
            "prettier",          -- Formatter
        },
    })
end

return M
