local registry = require("mason_list")
registry.add_lsp({
    "marksman", -- For markdown
})
registry.add_tools({
    "cspell",            -- Spell check
    "markdown-toc",      -- Markdown table of content generator
    "markdownlint-cli2", -- Markdown linter
    "prettier",          -- Formatter
})

local syntax = require("treesitter_list")
syntax.add({
    "markdown",
    "markdown_inline",
})

vim.pack.add({
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})

require("render-markdown").setup({
    code = {
        sign = false,
        width = "block",
        right_pad = 1,
    },
    heading = {
        sign = false,
        icons = {},
    },
    checkbox = {
        enabled = false,
    },
    bullet = {
        enabled = false,
    },
    latex = {
        enabled = false
    },
})

require("lint").linters_by_ft = {
    markdown = { "markdownlint-cli2" },
}

require("conform").formatters = {
    ["markdown-toc"] = {
        condition = function(_, ctx)
            for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
                if line:find("<!%-%- toc %-%->") then
                    return true
                end
            end
        end,
    },
    ["markdownlint-cli2"] = {
        condition = function(_, ctx)
            local diag = vim.tbl_filter(function(d)
                return d.source == "markdownlint"
            end, vim.diagnostic.get(ctx.buf))
            return #diag > 0
        end,
    },
}

require("conform").formatters_by_ft = {
    ["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
    ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
}
