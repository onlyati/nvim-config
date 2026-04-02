-- Terminal remap
vim.keymap.set("t", "<esc>", "<C-\\><C-N>")

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

-- Code keymaps
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format code" })
vim.keymap.set("n", "<leader>cq", function() require("utils").pick_diagnostics() end, { desc = "Open Quickfix" })
vim.keymap.set("n", "<leader>cr", function()
        local inc_rename = require("inc_rename")
        return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
    end,
    { expr = true, desc = "Rename" }
)
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
vim.keymap.set("n", "<leader>cd", function() require("utils").toogleDiagLines() end, { desc = "Toggle diag lines" })
vim.keymap.set("n", "<leader>cgt", function() vim.cmd(":W !templ generate") end, { desc = "Generate with templ" })
vim.keymap.set("n", "<leader>cgl",
    function() vim.cmd(":W !golangci-lint run --max-same-issues 0 --max-issues-per-linter  0") end,
    { desc = "Run golangci-lint" })


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

-- Neotest
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
vim.keymap.set("n", "<leader>|", "<cmd>vsplit | wincmd p<CR>", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>-", "<cmd>split | wincmd p<CR>", { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>e", function() MiniFiles.open() end, { desc = "Open Explorer " })
vim.keymap.set("n", "<leader>H", function() MiniNotify.show_history() end, { desc = "Open history " })
vim.keymap.set("v", "<s-J>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<s-K>", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-j>", "i<CR><Esc>")
vim.keymap.set("v", "<leader>cr", ":s/\t/    /g<CR>", { desc = "Replace tab with space" })
