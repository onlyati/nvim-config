vim.pack.add({
    -- Dependencies
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/antoinemadec/FixCursorHold.nvim" },

    -- Neotest
    { src = "https://github.com/nvim-neotest/neotest" },

    -- Neotest for Go
    { src = "https://github.com/fredrikaverpil/neotest-golang" }
})


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
                "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
            },
            runner = "gotestsum",
        }),
    },
    status = { virtual_text = true },
    output = { open_on_run = true },
})

vim.keymap.set("n", "<leader>ta", function() require("neotest").run.attach() end, { desc = "Attach to Test (Neotest)" })
vim.keymap.set("n", "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end,
    { desc = "Run File (Neotest)" })
vim.keymap.set("n", "<leader>tT", function()
        local cwd = vim.fn.getcwd()
        -- workaround
        if cwd:find("^/var/home") then
            cwd = cwd:gsub("^/var/home", "/home")
        end
        require("neotest").run.run(cwd)
    end,
    { desc = "Run All Test Files (Neotest)" })
vim.keymap.set("n", "<leader>tr", function() require("neotest").run.run() end, { desc = "Run Nearest (Neotest)" })
vim.keymap.set("n", "<leader>tl", function() require("neotest").run.run_last() end, { desc = "Run Last (Neotest)" })
vim.keymap.set("n", "<leader>ts", function() require("neotest").summary.toggle() end,
    { desc = "Toggle Summary (Neotest)" })
vim.keymap.set("n", "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end,
    { desc = "Show Output (Neotest)" })
vim.keymap.set("n", "<leader>tO", function() require("neotest").output_panel.toggle() end,
    { desc = "Toggle Output Panel (Neotest)" })
vim.keymap.set("n", "<leader>tS", function() require("neotest").run.stop() end, { desc = "Stop (Neotest)" })
vim.keymap.set("n", "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end,
    { desc = "Toggle Watch (Neotest)" })
vim.keymap.set("n", "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end,
    { desc = "Debug Nearest" })
