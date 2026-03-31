vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.omni_sql_default_compl_type = "syntax"
vim.o.termguicolors = true
vim.o.clipboard = 'unnamedplus'

-- Ability to toggle between diag modes, default is text
vim.g.diag_lines = false
require("utils").toogleDiagLines()

-- Tab settings
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true

-- Make easier replace some character totally
vim.o.langmap = "é$"

-- Other
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
vim.o.pumheight = 15
vim.o.pumborder = "rounded"
vim.o.winborder = "rounded"
vim.o.shell = "/bin/env zsh"

-- Fold settings
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldmethod = 'expr'
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldtext = ""
