local c = {
    bg0 = "#0d1117",
    bg1 = "#161b22",
    bg2 = "#21262d",
    fg0 = "#c9d1d9",
    fg1 = "#8b949e",

    red = "#ff7b72",
    orange = "#ffa657",
    yellow = "#f2cc60",
    green = "#7ee787",
    cyan = "#79c0ff",
    blue = "#58a6ff",
    purple = "#d2a8ff",
}

local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
vim.o.termguicolors = true
vim.g.colors_name = "ati_dark"

-- UI
hi("Normal", { fg = c.fg0, bg = c.bg0 })
hi("NormalFloat", { fg = c.fg0, bg = c.bg1 })
hi("FloatBorder", { fg = c.bg2, bg = c.bg1 })

hi("CursorLine", { bg = c.bg1 })
hi("CursorColumn", { bg = c.bg1 })
hi("ColorColumn", { bg = c.bg1 })

hi("LineNr", { fg = c.bg2 })
hi("CursorLineNr", { fg = c.fg0, bg = c.bg1 })

hi("Visual", { bg = c.bg2 })
hi("Search", { fg = c.bg0, bg = c.yellow })
hi("IncSearch", { fg = c.bg0, bg = c.orange })

hi("Pmenu", { fg = c.fg0, bg = c.bg1 })
hi("PmenuSel", { fg = c.fg0, bg = c.bg2 })
hi("PmenuSbar", { bg = c.bg2 })
hi("PmenuThumb", { bg = c.fg1 })

hi("StatusLine", { fg = c.fg0, bg = c.bg1 })
hi("StatusLineNC", { fg = c.fg1, bg = c.bg1 })
hi("WinSeparator", { fg = c.bg2 })

-- Basic syntax
hi("Comment", { fg = c.fg1, italic = true })
hi("Constant", { fg = c.cyan })
hi("String", { fg = c.green })
hi("Character", { fg = c.green })
hi("Number", { fg = c.cyan })
hi("Boolean", { fg = c.cyan })
hi("Identifier", { fg = c.cyan })
hi("Function", { fg = c.blue })
hi("Statement", { fg = c.purple })
hi("Keyword", { fg = c.purple })
hi("Operator", { fg = c.fg0 })
hi("PreProc", { fg = c.orange })
hi("Type", { fg = c.yellow })
hi("Special", { fg = c.orange })
hi("Macro", { fg = c.orange })
hi("ModeMsg", { fg = c.orange, bold = true })

-- Diagnostics
hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn", { fg = c.yellow })
hi("DiagnosticInfo", { fg = c.blue })
hi("DiagnosticHint", { fg = c.cyan })

hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.yellow })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.blue })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.cyan })

-- Treesitter links
hi("@comment", { link = "Comment" })
hi("@string", { link = "String" })
hi("@function", { link = "Function" })
hi("@keyword", { link = "Keyword" })
hi("@type", { link = "Type" })
hi("@constant", { link = "Constant" })
hi("@number", { link = "Number" })
hi("@variable", { link = "Identifier" })
hi("@variable.builtin", { fg = c.cyan })
hi("@function.builtin", { fg = c.blue })
hi("@type.builtin", { fg = c.yellow })
hi("@parameter", { fg = c.blue })
hi("@property", { fg = c.fg0 })
hi("@namespace", { fg = c.orange })

-- GitSigns
hi("GitSignsAdd", { fg = c.green })
hi("GitSignsChange", { fg = c.yellow })
hi("GitSignsDelete", { fg = c.red })

-- LSP semantic tokens
-- Base types
hi("@lsp.type.namespace", { link = "@namespace" })
hi("@lsp.type.type", { link = "Type" })
hi("@lsp.type.class", { link = "Type" })
hi("@lsp.type.struct", { link = "Type" })
hi("@lsp.type.interface", { link = "Type" })
hi("@lsp.type.enum", { link = "Type" })
hi("@lsp.type.typeParameter", { link = "Type" })

hi("@lsp.type.parameter", { link = "@parameter" })
hi("@lsp.type.variable", { fg = c.fg0 })
hi("@lsp.type.property", { link = "@property" })
hi("@lsp.type.enumMember", { link = "@constant" })

hi("@lsp.type.function", { link = "Function" })
hi("@lsp.type.method", { link = "Function" })
hi("@lsp.type.macro", { link = "Macro" })

hi("@lsp.type.keyword", { link = "Keyword" })
hi("@lsp.type.comment", { link = "Comment" })
hi("@lsp.type.string", { link = "String" })
hi("@lsp.type.number", { link = "Number" })
hi("@lsp.type.operator", { link = "Operator" })

-- Common “mods” (typemod = type + modifier)
hi("@lsp.typemod.variable.readonly", { link = "@constant" })
hi("@lsp.typemod.property.readonly", { link = "@constant" })
hi("@lsp.typemod.parameter.readonly", { link = "@constant" })
hi("@lsp.typemod.variable.signature", { link = "@constant" })
hi("@lsp.typemod.variable.struct", { link = "@constant" })
hi("@lsp.typemod.variable.global", { link = "@constant" })
hi("@lsp.typemod.variable.definition", { link = "@constant" })

hi("@lsp.typemod.function.declaration", { link = "Function" })
hi("@lsp.typemod.method.declaration", { link = "Function" })

hi("@lsp.typemod.variable.defaultLibrary", { link = "@variable.builtin" })
hi("@lsp.typemod.function.defaultLibrary", { link = "@function.builtin" })
hi("@lsp.typemod.type.defaultLibrary", { link = "@type.builtin" })
