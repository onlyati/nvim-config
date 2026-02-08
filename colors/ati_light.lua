local c = {
    bg0           = "#fbf3e6",
    bg1           = "#f3eadb",
    bg2           = "#e3d7c4",
    fg0           = "#1f2328",
    fg1           = "#6a625a",
    red           = "#b42318",
    orange        = "#9a4d00",
    yellow        = "#7a5c00",
    green         = "#1f6f43",
    cyan          = "#0b4f79",
    blue          = "#1e4e8c",
    purple        = "#6f42c1",
    search_yellow = "#ffe8a3",
    search_orange = "#ffd1a6",
    cursor_line   = "#e5f1ff",
}

local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

vim.o.termguicolors = true
vim.g.colors_name = "ati_light"

-- Plugin related
hi("OilDir", { fg = c.blue })
hi("tomlTable", { fg = c.cyan })
hi("tomlTableArray", { link = "tomlTable" })
hi("markdownH1", { fg = c.cyan })
hi("markdownH2", { link = "markdownH1" })
hi("markdownH3", { link = "markdownH1" })
hi("markdownH4", { link = "markdownH1" })
hi("markdownH5", { link = "markdownH1" })
hi("markdownH6", { link = "markdownH1" })
hi("@markup.heading", { link = "markdownH1" })
hi("NeotestPassed", { fg = c.green })
hi("NeotestRunning", { fg = c.yellow })
hi("NeotestFile", { fg = c.cyan })
hi("NeotestDir", { link = "NeotestFile" })
hi("Added", { fg = c.green })
hi("MiniTablineCurrent", { fg = c.cyan, bold = true, reverse = true })
hi("MiniTablineHidden", { bg = c.bg2 })
hi("MiniTablineModifiedCurrent", { link = "MiniTablineCurrent" })
hi("MiniTablineFill", { bg = c.fg0 })
hi("MiniClueBorder", { fg = c.fg1 })
hi("MiniClueSeparator", { fg = c.fg1 })
hi("MiniClueTitle", { fg = c.cyan, bold = true })
hi("MiniClueDescSingle", { fg = c.fg0 })
hi("MiniClueDescGroup", { fg = c.fg0 })
hi("MiniPickBorder", { link = "MiniClueBorder" })
hi("MiniPickBorderText", { link = "MiniClueTitle" })
hi("MiniPickMatchCurrent", { fg = c.blue, bg = c.bg2, reverse = true })
hi("MiniNotifyTitle", { link = "MiniClueTitle" })
hi("MiniNotifyBorder", { link = "MiniClueBorder" })
hi("MiniIndentscopeSymbol", { fg = c.red })
hi("MiniIndentscopeSymbolOff", { fg = c.green })
hi("IblIndent", { fg = c.bg2 })
hi("MiniStarterHeader", { link = "MiniClueTitle" })
hi("MiniStarterFooter", { fg = c.fg1 })
hi("MiniStarterItemBuller", { fg = c.red })
hi("MiniIconsAzure", { fg = c.cyan })
hi("MiniIconsBlue", { fg = c.blue })
hi("MiniIconsCyan", { fg = c.cyan })
hi("MiniIconsGreen", { fg = c.green })
hi("MiniIconsGrey", { fg = c.fg1 })
hi("MiniIconsOrange", { fg = c.orange })
hi("MiniIconsPurple", { fg = c.purple })
hi("MiniIconsRed", { fg = c.red })
hi("MiniIconsYellow", { fg = c.yellow })

-- UI
hi("Normal", { fg = c.fg0, bg = c.bg0 })
hi("NormalFloat", { fg = c.fg0, bg = c.bg1 })
hi("FloatBorder", { fg = c.bg2, bg = c.bg1 })

hi("CursorLine", { bg = c.cursor_line })
hi("CursorColumn", { bg = c.bg1 })
hi("ColorColumn", { bg = c.bg1 })

hi("LineNr", { fg = c.bg2 })
hi("CursorLineNr", { fg = c.fg0, bg = c.bg1 })

hi("Visual", { bg = c.bg2 })
hi("Search", { fg = c.fg0, bg = c.search_yellow })
hi("IncSearch", { fg = c.fg0, bg = c.search_orange })

hi("Pmenu", { fg = c.fg0, bg = c.bg1 })
hi("PmenuSel", { fg = c.purple, bg = c.bg2 })
hi("PmenuSbar", { bg = c.bg2 })
hi("PmenuThumb", { bg = c.fg1 })
hi("PmenuExtra", { fg = c.green })

hi("StatusLine", { fg = c.fg0, bg = c.bg1 })
hi("StatusLineNC", { fg = c.fg1, bg = c.bg1 })
hi("WinSeparator", { fg = c.bg2 })

-- Punctuation/delimiters: make brackets/colons obvious
hi("Delimiter", { fg = c.fg0 })
hi("Operator", { fg = c.fg0 })

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

hi("ErrorMsg", { fg = c.red })
hi("WarningMsg", { fg = c.yellow })
hi("Question", { fg = c.blue })
hi("MoreMsg", { fg = c.cyan })

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

-- Treesitter punctuation
hi("@punctuation.delimiter", { link = "Delimiter" })
hi("@punctuation.bracket", { link = "Delimiter" })
hi("@punctuation.special", { link = "Delimiter" })
hi("@operator", { link = "Operator" })

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
