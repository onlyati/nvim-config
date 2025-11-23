vim.pack.add({
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
    { src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
    formatters = {
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
    },
    formatters_by_ft = {
        ["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
        ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
        ["go"] = { "goimports", "gofumpt" },
        ["json"] = { "jq" },
    },
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
})
