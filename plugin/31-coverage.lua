vim.pack.add({
    -- Neovim coverage
    { src = "https://github.com/andythigpen/nvim-coverage" },
})

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

vim.keymap.set("n", "<leader>ccc", function()
    if vim.g.coverage_show == nil then
        vim.cmd(":CoverageLoad")
    end
    if vim.g.coverage_show == true then
        vim.cmd(":CoverageHide")
        vim.g.coverage_show = false
    else
        vim.cmd(":CoverageShow")
        vim.g.coverage_show = true
    end
end, { desc = "Toggle coverage" })

vim.keymap.set("n", "<leader>ccs", function()
    if vim.g.coverage_show == nil then
        vim.cmd(":CoverageLoad")
        vim.g.coverage_show = false
    end
    vim.cmd(":CoverageSummary")
end, { desc = "Coverage summary" })
