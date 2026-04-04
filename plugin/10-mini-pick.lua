vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.pick" },
})

require("mini.pick").setup({})

-- Go to keys
vim.keymap.set("n", "gd", ":Pick lsp scope='definition'<CR>", { desc = "Go to definition" })
vim.keymap.set("n", "grr", ":Pick lsp scope='references'<CR>", { desc = "Go to references" })
vim.keymap.set("n", "<leader>gd", ":Pick lsp scope='definition'<CR>", { desc = "Go to definition" })
vim.keymap.set("n", "<leader>gr", ":Pick lsp scope='references'<CR>", { desc = "Go to references" })

-- Search functions
vim.keymap.set("n", "<leader><space>", ":Pick files<CR>", { desc = "Files search" })
vim.keymap.set("n", "<leader>sf", ":Pick files<CR>", { desc = "Files search" })
vim.keymap.set("n", "<leader>sb", ":Pick buffers<CR>", { desc = "Buffer search" })
vim.keymap.set("n", "<leader>sg", ":Pick grep_live<CR>", { desc = "Grep search" })
vim.keymap.set("n", "<leader>s\"", ":Pick registers<CR>", { desc = "Register search" })
vim.keymap.set("n", "<leader>sa", ":Pick commands<CR>", { desc = "Auto commands search" })
vim.keymap.set("n", "<leader>sd", ":Pick diagnostic<CR>", { desc = "Diagnostics search" })
