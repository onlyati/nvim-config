vim.pack.add({
    -- Dependency for DAP and Neotest
    { src = "https://github.com/nvim-neotest/nvim-nio" },

    -- DAP
    { src = "https://github.com/mfussenegger/nvim-dap" },
    { src = "https://github.com/rcarriga/nvim-dap-ui" },

    -- DAP for Go
    { src = "https://github.com/leoluz/nvim-dap-go" },
})

require("dapui").setup()

vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Breakpoint toggle" })
vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Run" })
vim.keymap.set("n", "<leader>dC", function() require("dap").run_to_cursor() end, { desc = "Run to cursor" })
vim.keymap.set("n", "<leader>dt", "<cmd>DapTerminate<CR>", { desc = "Terminate debug" })
vim.keymap.set("n", "<leader>di", "<cmd>DapStepInto<CR>", { desc = "Step into" })
vim.keymap.set("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle debug UI" })
vim.keymap.set("n", "<leader>de", function() require("dapui").eval() end, { desc = "Eval" })
vim.keymap.set("x", "<leader>de", function() require("dapui").eval() end, { desc = "Eval" })
