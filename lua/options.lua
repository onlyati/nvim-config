vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.omni_sql_default_compl_type = "syntax"
vim.o.termguicolors = true
vim.o.clipboard = 'unnamedplus'
vim.diagnostic.config({
    virtual_lines = {
        format = function(diag)
            local severity_icon = {
                [vim.diagnostic.severity.ERROR] = "",
                [vim.diagnostic.severity.WARN]  = "",
                [vim.diagnostic.severity.INFO]  = "",
                [vim.diagnostic.severity.HINT]  = "",
            }
            local template = severity_icon[diag.severity] .. " " .. diag.source .. ": " .. diag.message
            return template
        end
    },
})
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.scrolloff = 8
vim.o.wrap = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.signcolumn = "yes"
vim.o.undofile = true
vim.o.mouse = "a"
vim.o.confirm = true
vim.o.colorcolumn = "+2"
vim.o.list = true
vim.o.complete = ".,o,w,b,u"
vim.o.completeopt = "fuzzy,menuone,noselect"
-- vim.o.autocomplete = true
vim.o.pumheight = 7
vim.o.winborder = "rounded"
vim.o.spelllang = "hu,en"
