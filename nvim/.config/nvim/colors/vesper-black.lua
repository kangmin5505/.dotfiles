-- Vesper Black - Neovim colorscheme
-- Ported from VS Code Vesper Black by michaljach
-- https://github.com/michaljach/vesper-black

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "vesper-black"
vim.o.background = "dark"
vim.o.termguicolors = true

local c = {
  bg        = "#000000",
  fg        = "#FFFFFF",
  comment   = "#505050",
  gray      = "#A0A0A0",
  orange    = "#FFC799",
  red       = "#FF8080",
  green     = "#99FFE4",
  line_nr   = "#505050",
  selection = "#333333",
  cursorln  = "#101010",
  border    = "#282828",
  widget_bg = "#161616",
  float_bg  = "#101010",
  visual    = "#333333",
  pmenu_bg  = "#161616",
  pmenu_sel = "#282828",
  diff_add  = "#99FFE420",
  diff_del  = "#FF808020",
  none      = "NONE",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor
hi("Normal",         { fg = c.fg, bg = c.bg })
hi("NormalFloat",    { fg = c.fg, bg = c.float_bg })
hi("FloatBorder",    { fg = c.border, bg = c.float_bg })
hi("Cursor",         { fg = c.bg, bg = c.fg })
hi("CursorLine",     { bg = c.cursorln })
hi("CursorColumn",   { bg = c.cursorln })
hi("ColorColumn",    { bg = c.cursorln })
hi("LineNr",         { fg = c.line_nr })
hi("CursorLineNr",   { fg = c.orange, bold = true })
hi("SignColumn",     { fg = c.line_nr, bg = c.bg })
hi("VertSplit",      { fg = c.border })
hi("WinSeparator",   { fg = c.border })
hi("StatusLine",     { fg = c.gray, bg = c.cursorln })
hi("StatusLineNC",   { fg = c.comment, bg = c.cursorln })
hi("TabLine",        { fg = c.gray, bg = c.bg })
hi("TabLineFill",    { bg = c.bg })
hi("TabLineSel",     { fg = c.fg, bg = c.widget_bg })
hi("WinBar",         { fg = c.gray, bg = c.bg })
hi("WinBarNC",       { fg = c.comment, bg = c.bg })

-- Search & Selection
hi("Visual",         { bg = c.visual })
hi("VisualNOS",      { bg = c.visual })
hi("Search",         { fg = c.bg, bg = c.orange })
hi("IncSearch",      { fg = c.bg, bg = c.orange })
hi("CurSearch",      { fg = c.bg, bg = c.orange, bold = true })
hi("Substitute",     { fg = c.bg, bg = c.red })

-- Popup Menu
hi("Pmenu",          { fg = c.fg, bg = c.pmenu_bg })
hi("PmenuSel",       { fg = c.orange, bg = c.pmenu_sel })
hi("PmenuSbar",      { bg = c.pmenu_bg })
hi("PmenuThumb",     { bg = c.comment })

-- Messages
hi("ErrorMsg",       { fg = c.red })
hi("WarningMsg",     { fg = c.orange })
hi("MoreMsg",        { fg = c.green })
hi("ModeMsg",        { fg = c.fg, bold = true })
hi("Question",       { fg = c.orange })

-- Fold & Special
hi("Folded",         { fg = c.comment, bg = c.cursorln })
hi("FoldColumn",     { fg = c.comment, bg = c.bg })
hi("NonText",        { fg = "#222222" })
hi("SpecialKey",     { fg = "#222222" })
hi("Conceal",        { fg = c.comment })
hi("EndOfBuffer",    { fg = c.bg })
hi("MatchParen",     { fg = c.orange, bold = true, underline = true })
hi("Directory",      { fg = c.orange })
hi("Title",          { fg = c.orange, bold = true })

-- Diff
hi("DiffAdd",        { fg = c.green, bg = "#0a1f1a" })
hi("DiffChange",     { fg = c.orange, bg = "#1a1400" })
hi("DiffDelete",     { fg = c.red, bg = "#1f0a0a" })
hi("DiffText",       { fg = c.orange, bg = "#2a2000", bold = true })

-- Diagnostics
hi("DiagnosticError",          { fg = c.red })
hi("DiagnosticWarn",           { fg = c.orange })
hi("DiagnosticInfo",           { fg = c.gray })
hi("DiagnosticHint",           { fg = c.comment })
hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.orange })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.gray })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.comment })

-- Syntax (base vim)
hi("Comment",        { fg = c.comment, italic = true })
hi("Constant",       { fg = c.orange })
hi("String",         { fg = c.fg })
hi("Character",      { fg = c.orange })
hi("Number",         { fg = c.orange })
hi("Boolean",        { fg = c.orange })
hi("Float",          { fg = c.orange })
hi("Identifier",     { fg = c.fg })
hi("Function",       { fg = c.orange })
hi("Statement",      { fg = c.gray })
hi("Conditional",    { fg = c.gray })
hi("Repeat",         { fg = c.gray })
hi("Label",          { fg = c.gray })
hi("Operator",       { fg = c.gray })
hi("Keyword",        { fg = c.gray })
hi("Exception",      { fg = c.gray })
hi("PreProc",        { fg = c.gray })
hi("Include",        { fg = c.gray })
hi("Define",         { fg = c.gray })
hi("Macro",          { fg = c.gray })
hi("PreCondit",      { fg = c.gray })
hi("Type",           { fg = c.fg })
hi("StorageClass",   { fg = c.gray })
hi("Structure",      { fg = c.fg })
hi("Typedef",        { fg = c.fg })
hi("Special",        { fg = c.gray })
hi("SpecialChar",    { fg = c.gray })
hi("Tag",            { fg = c.orange })
hi("Delimiter",      { fg = c.gray })
hi("SpecialComment", { fg = c.comment, italic = true })
hi("Debug",          { fg = c.red })
hi("Underlined",     { fg = c.orange, underline = true })
hi("Error",          { fg = c.red })
hi("Todo",           { fg = c.orange, bold = true })

-- Treesitter
hi("@comment",               { link = "Comment" })
hi("@variable",              { fg = c.fg })
hi("@variable.builtin",      { fg = c.gray })
hi("@variable.parameter",    { fg = c.fg })
hi("@variable.member",       { fg = c.fg })
hi("@constant",              { fg = c.orange })
hi("@constant.builtin",      { fg = c.orange })
hi("@constant.macro",        { fg = c.orange })
hi("@string",                { fg = c.fg })
hi("@string.escape",         { fg = c.gray })
hi("@string.regex",          { fg = c.gray })
hi("@character",             { fg = c.orange })
hi("@number",                { fg = c.orange })
hi("@boolean",               { fg = c.orange })
hi("@float",                 { fg = c.orange })
hi("@function",              { fg = c.orange })
hi("@function.builtin",      { fg = c.orange })
hi("@function.call",         { fg = c.orange })
hi("@function.macro",        { fg = c.orange })
hi("@method",                { fg = c.orange })
hi("@method.call",           { fg = c.orange })
hi("@constructor",           { fg = c.orange })
hi("@keyword",               { fg = c.gray })
hi("@keyword.function",      { fg = c.gray })
hi("@keyword.operator",      { fg = c.gray })
hi("@keyword.return",        { fg = c.gray })
hi("@conditional",           { fg = c.gray })
hi("@repeat",                { fg = c.gray })
hi("@label",                 { fg = c.gray })
hi("@operator",              { fg = c.gray })
hi("@exception",             { fg = c.gray })
hi("@include",               { fg = c.gray })
hi("@type",                  { fg = c.fg })
hi("@type.builtin",          { fg = c.gray })
hi("@type.definition",       { fg = c.fg })
hi("@type.qualifier",        { fg = c.gray })
hi("@namespace",             { fg = c.fg })
hi("@punctuation.bracket",   { fg = c.gray })
hi("@punctuation.delimiter", { fg = c.gray })
hi("@punctuation.special",   { fg = c.gray })
hi("@tag",                   { fg = c.orange })
hi("@tag.attribute",         { fg = c.orange })
hi("@tag.delimiter",         { fg = c.gray })
hi("@property",              { fg = c.fg })
hi("@field",                 { fg = c.fg })
hi("@parameter",             { fg = c.fg })
hi("@text",                  { fg = c.fg })
hi("@text.strong",           { fg = c.fg, bold = true })
hi("@text.emphasis",         { fg = c.fg, italic = true })
hi("@text.underline",        { fg = c.fg, underline = true })
hi("@text.title",            { fg = c.orange, bold = true })
hi("@text.literal",          { fg = c.gray })
hi("@text.uri",              { fg = c.orange, underline = true })
hi("@text.todo",             { fg = c.orange, bold = true })
hi("@text.note",             { fg = c.gray })
hi("@text.warning",          { fg = c.orange })
hi("@text.danger",           { fg = c.red })

-- New-style treesitter captures (nvim 0.10+)
hi("@keyword.directive",        { fg = c.gray })
hi("@keyword.directive.define", { fg = c.gray })
hi("@keyword.type",             { fg = c.gray })
hi("@keyword.modifier",         { fg = c.gray })
hi("@keyword.import",           { fg = c.gray })
hi("@keyword.repeat",           { fg = c.gray })
hi("@keyword.conditional",      { fg = c.gray })
hi("@keyword.exception",        { fg = c.gray })
hi("@function.macro",           { fg = c.orange })
hi("@constant.macro",           { fg = c.orange })

-- LSP Semantic Tokens
hi("@lsp.type.function",     { fg = c.orange })
hi("@lsp.type.method",       { fg = c.orange })
hi("@lsp.type.variable",     { fg = c.fg })
hi("@lsp.type.parameter",    { fg = c.fg })
hi("@lsp.type.property",     { fg = c.fg })
hi("@lsp.type.class",        { fg = c.fg })
hi("@lsp.type.type",         { fg = c.fg })
hi("@lsp.type.interface",    { fg = c.fg })
hi("@lsp.type.struct",       { fg = c.fg })
hi("@lsp.type.enum",         { fg = c.fg })
hi("@lsp.type.enumMember",   { fg = c.orange })
hi("@lsp.type.namespace",    { fg = c.fg })
hi("@lsp.type.keyword",      { fg = c.gray })
hi("@lsp.type.macro",        { fg = c.orange })
hi("@lsp.type.comment",      { link = "Comment" })

-- Git Signs
hi("GitSignsAdd",            { fg = c.green, bg = c.bg })
hi("GitSignsChange",         { fg = c.orange, bg = c.bg })
hi("GitSignsDelete",         { fg = c.red, bg = c.bg })

-- Telescope
hi("TelescopeNormal",        { fg = c.fg, bg = c.float_bg })
hi("TelescopeBorder",        { fg = c.border, bg = c.float_bg })
hi("TelescopeSelection",     { fg = c.orange, bg = c.pmenu_sel })
hi("TelescopeMatching",      { fg = c.orange, bold = true })
hi("TelescopePromptPrefix",  { fg = c.orange })

-- Indent Blankline
hi("IblIndent",              { fg = "#151515" })
hi("IblScope",               { fg = "#333333" })

-- Lazy
hi("LazyButton",             { fg = c.fg, bg = c.widget_bg })
hi("LazyButtonActive",       { fg = c.bg, bg = c.orange })
hi("LazyH1",                 { fg = c.bg, bg = c.orange, bold = true })

-- WhichKey
hi("WhichKey",               { fg = c.orange })
hi("WhichKeyGroup",          { fg = c.gray })
hi("WhichKeyDesc",           { fg = c.fg })
hi("WhichKeySeparator",      { fg = c.comment })

-- Mini
hi("MiniStatuslineFilename", { fg = c.fg, bg = c.cursorln })
hi("MiniStatuslineDevinfo",  { fg = c.gray, bg = c.widget_bg })
hi("MiniStatuslineFileinfo", { fg = c.gray, bg = c.widget_bg })
hi("MiniStatuslineModeNormal",  { fg = c.bg, bg = c.gray, bold = true })
hi("MiniStatuslineModeInsert",  { fg = c.bg, bg = c.green, bold = true })
hi("MiniStatuslineModeVisual",  { fg = c.bg, bg = c.orange, bold = true })
hi("MiniStatuslineModeCommand", { fg = c.bg, bg = c.red, bold = true })
hi("MiniStatuslineModeReplace", { fg = c.bg, bg = c.red, bold = true })
