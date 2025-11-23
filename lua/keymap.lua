-- Categories
local wk = require("which-key")
wk.add({
    { "<leader>c", group = "Code" },
    { "<leader>s", group = "Search" },
    { "<leader>b", group = "Buffer" },
    { "<leader>g", group = "Go to" },
    { "<leader>d", group = "Debug" },
    { "<leader>t", group = "Testing" },
    { "<leader>q", group = "Session" },
})

-- Code keymaps
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format code" })
vim.keymap.set("n", "<leader>cq", vim.diagnostic.setloclist, { desc = "Open Quickfix" })
vim.keymap.set("n", "<leader>cr", function()
        local inc_rename = require("inc_rename")
        return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
    end,
    { expr = true, desc = "Rename" }
)

-- Remap end
vim.keymap.set("n", "é", "$")
vim.keymap.set("n", "vé", "v$")
vim.keymap.set("n", "cé", "c$")
vim.keymap.set("n", "dé", "d$")

-- Buffer related
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-h>", "<cmd>bprev<CR>")
vim.keymap.set("n", "<leader>bb", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bo", function()
    U = require("utils"); U.close_other_buffers()
end, { desc = "Close other buffers" })

-- Go to keys
vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Go to definition" })
vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { desc = "Go to references" })

-- Search functions
vim.keymap.set("n", "<leader><space>", function() Snacks.picker.files() end, { desc = "Files search" })
vim.keymap.set("n", "<leader>sf", function() Snacks.picker.files() end, { desc = "Files search" })
vim.keymap.set("n", "<leader>sb", function() Snacks.picker.buffers() end, { desc = "Buffer search" })
vim.keymap.set("n", "<leader>sg", function() Snacks.picker.grep() end, { desc = "Grep search" })
vim.keymap.set("n", "<leader>s\"", function() Snacks.picker.registers() end, { desc = "Register search" })
vim.keymap.set("n", "<leader>sa", function() Snacks.picker.autocmds() end, { desc = "Auto commands search" })
vim.keymap.set("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics search" })
vim.keymap.set("n", "<leader>si", function() Snacks.picker.icons() end, { desc = "Icon search" })

-- Neotest
vim.keymap.set("n", "<leader>ta", function() require("neotest").run.attach() end, { desc = "Attach to Test (Neotest)" })
vim.keymap.set("n", "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end,
    { desc = "Run File (Neotest)" })
vim.keymap.set("n", "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end,
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

-- Debug keymaps
vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Breakpoint toggle" })
vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Run" })
vim.keymap.set("n", "<leader>dC", function() require("dap").run_to_cursor() end, { desc = "Run to cursor" })
vim.keymap.set("n", "<leader>dt", "<cmd>DapTerminate<CR>", { desc = "Terminate debug" })
vim.keymap.set("n", "<leader>di", "<cmd>DapStepInto<CR>", { desc = "Step into" })
vim.keymap.set("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle debug UI" })
vim.keymap.set("n", "<leader>de", function() require("dapui").eval() end, { desc = "Eval" })
vim.keymap.set("x", "<leader>de", function() require("dapui").eval() end, { desc = "Eval" })

-- Other keymaps
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<C-w>s", "<cmd>split<CR>", { desc = "Split horizontally" })
vim.keymap.set("n", "<C-w>|", "<cmd>vsplit<CR>", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>|", "<cmd>vsplit<CR>", { desc = "Split vertically" })
vim.keymap.set("v", "<s-J>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<s-K>", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-j>", "i<CR><Esc>")
vim.keymap.set("v", "<leader>cr", ":s/\t/    /g<CR>", { desc = "Replace tab with space" })
vim.keymap.set("n", "<leader>ql", function() require("persistence").load() end)
