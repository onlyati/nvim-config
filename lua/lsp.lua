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
        "go", "gomod", "gowork", "gosum",
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
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "go", "markdown" },
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

    require('treesitter-context').setup()

    -- Install languager servers, modules, utilies, etc.
    require("mason").setup()

    -- This install the required server plus enable LSP config
    require("mason-lspconfig").setup({
        ensure_installed = {
            "lua_ls",           -- For Lua
            "gopls",            -- For Go
            "golangci_lint_ls", -- For Go lint
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
