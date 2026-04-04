-- Terminal remap
vim.keymap.set("t", "<esc>", "<C-\\><C-N>")

-- Code keymaps
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format code" })
vim.keymap.set("n", "<leader>cq", function() require("utils").pick_diagnostics() end, { desc = "Open Quickfix" })
vim.keymap.set("n", "<leader>cd", function() require("utils").toogleDiagLines() end, { desc = "Toggle diag lines" })

-- Buffer related
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-h>", "<cmd>bprev<CR>")
vim.keymap.set("n", "<leader>bb", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>b#<CR>:bd#<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bo", function()
    U = require("utils"); U.close_other_buffers()
end, { desc = "Close other buffers" })

-- Other keymaps
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<C-w>s", "<cmd>split<CR>", { desc = "Split horizontally" })
vim.keymap.set("n", "<C-w>|", "<cmd>vsplit<CR>", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>|", "<cmd>vsplit | wincmd p<CR>", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>-", "<cmd>split | wincmd p<CR>", { desc = "Split horizontally" })
vim.keymap.set("v", "<s-J>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<s-K>", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-j>", "i<CR><Esc>")
vim.keymap.set("v", "<leader>cr", ":s/\t/    /g<CR>", { desc = "Replace tab with space" })
