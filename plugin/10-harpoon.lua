vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    {
        src = "https://github.com/ThePrimeagen/harpoon",
        version = "harpoon2"
    },
})

require("harpoon").setup({})
local harpoon = require("harpoon")

-- Harpoon keymaps
vim.keymap.set("n", "<C-l>", function() harpoon:list():next() end, { desc = "Next pin" })
vim.keymap.set("n", "<C-h>", function() harpoon:list():prev() end, { desc = "Previous pin" })
vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Select Pin #1" })
vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Select Pin #2" })
vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Select Pin #3" })
vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Select Pin #4" })
vim.keymap.set("n", "<leader>h5", function() harpoon:list():select(5) end, { desc = "Select Pin #5" })
vim.keymap.set("n", "<leader>h6", function() harpoon:list():select(6) end, { desc = "Select Pin #6" })
vim.keymap.set("n", "<leader>ho", function()
    harpoon.ui:toggle_quick_menu(harpoon:list(), {
        border = "rounded",
        title = "",
    })
end, { desc = "Toggle UI" })

vim.keymap.set("n", "<leader>ha", function()
    local buf_name = vim.api.nvim_buf_get_name(0)
    local buf_type = vim.bo.buftype

    if buf_name == "" or buf_type == "terminal" or buf_type == "nofile" then
        vim.notify("Cannot add terminal or special buffers to Harpoon!", vim.log.levels.WARN)
        return
    end

    harpoon:list():add()
    vim.notify("File added to Harpoon pool!", vim.log.levels.INFO)
end, { desc = "Add buffer" })

vim.keymap.set("n", "<leader>ht", function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == "terminal" and vim.b[buf].editor_terminal then
            vim.api.nvim_set_current_buf(buf)
            vim.cmd("startinsert")
            return
        end
    end

    vim.cmd("terminal")
    local new_buffer = vim.api.nvim_get_current_buf()
    vim.b[new_buffer].editor_terminal = true

    pcall(vim.api.nvim_buf_set_name, new_buffer, "MainTerminal")

    vim.cmd("startinsert")
end, { desc = "Open terminal" })
