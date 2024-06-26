local palette = require('nightsky.palette')

local M = {}
local highlights = {
    plugins = {},
    languages = {},
}

local function set(new_highlights, default_highlights)
    for group, options in pairs(new_highlights) do
	local default_options = default_highlights[group] or {}

	local attributes_command = string.format('guifg=%s guibg=%s guisp=%s gui=%s',
	    default_options.fg or options.fg or 'none',
	    default_options.bg or options.bg or 'none',
	    default_options.sp or options.sp or 'none',
	    default_options.fmt or options.fmt or 'none'
	)

	vim.api.nvim_command('hi ' .. group .. ' ' .. attributes_command)

	-- For syntax fallback in case there is no treesitter parser
	if options.aliases then
	    for _, alias in pairs(options.aliases) do
		vim.api.nvim_command('hi ' .. alias .. ' ' .. attributes_command)
	    end
	end
    end
end

highlights.editor = {
    Normal = { fg = palette.fg, bg = palette.bg },
    Terminal = { fg = palette.fg, bg = palette.bg },
    EndOfBuffer = { fg = palette.bg or palette.bg, bg = palette.bg },
    FoldColumn = { fg = palette.fg, bg = palette.bg },
    Folded = { fg = palette.fg, bg = palette.bg_1 },
    SignColumn = { fg = palette.fg, bg = palette.bg },
    ToolbarLine = { fg = palette.fg },
    Cursor = { fmt = 'reverse' },
    vCursor = { fmt = 'reverse' },
    iCursor = { fmt = 'reverse' },
    lCursor = { fmt = 'reverse' },
    CursorIM = { fmt = 'reverse' },
    CursorColumn = { bg = palette.bg_1 },
    CursorLine = { bg = palette.bg_1 },
    ColorColumn = { bg = palette.bg_1 },
    CursorLineNr = { fg = palette.fg, fmt = 'bold' },
    LineNr = { fg = palette.gray },
    Conceal = { fg = palette.gray, bg = palette.bg },
    DiffAdd = { fg = palette.green, bg = palette.bg_diff_add },
    DiffChange = { fg = palette.yellow, bg = palette.bg_diff_change },
    DiffDelete = { fg = palette.red, bg = palette.bg_diff_delete },
    DiffText = { fg = palette.fg, bg = palette.bg_diff_info },
    DiffAdded = { fg = palette.green },
    DiffRemoved = { fg = palette.red },
    DiffFile = { fg = palette.cyan },
    DiffIndexLine = { fg = palette.gray },
    Directory = { fg = palette.blue },
    ErrorMsg = { fg = palette.red, fmt = 'bold' },
    WarningMsg = { fg = palette.yellow, fmt = 'bold' },
    MoreMsg = { fg = palette.blue, fmt = 'bold' },
    IncSearch = { fg = palette.bg, bg = palette.orange },
    Search = { fg = palette.fg, bg = palette.accent_darker },
    Substitute = { fg = palette.bg, bg = palette.green },
    MatchParen = { fg = palette.yellow, fmt = 'bold' },
    NonText = { fg = palette.gray },
    Whitespace = { fg = palette.bg_3 },
    SpecialKey = { fg = palette.gray },
    Pmenu = { fg = palette.fg, bg = palette.bg_2 },
    PmenuSbar = { fg = palette.none, bg = palette.bg_1 },
    PmenuSel = { fg = palette.fg, bg = palette.accent },
    PmenuThumb = { fg = palette.none, bg = palette.gray },
    WildMenu = { fg = palette.bg, bg = palette.blue },
    Question = { fg = palette.yellow },
    SpellBad = { fg = palette.red, fmt = 'underline', sp = palette.red },
    SpellCap = { fg = palette.yellow, fmt = 'underline', sp = palette.yellow },
    SpellLocal = { fg = palette.blue, fmt = 'underline', sp = palette.blue },
    SpellRare = { fg = palette.violet, fmt = 'underline', sp = palette.violet },
    StatusLine = { fg = palette.fg, bg = palette.accent_darker },
    StatusLineNC = { fg = palette.gray, bg = palette.bg_2 },
    StatusLineTerm = { fg = palette.fg, bg = palette.accent_darker },
    StatusLineTermNC = { fg = palette.gray, bg = palette.bg_2 },
    TabLine = { fg = palette.fg, bg = palette.bg_1 },
    TabLineFill = { fg = palette.gray, bg = palette.bg_1 },
    TabLineSel = { fg = palette.bg, bg = palette.fg },
    VertSplit = { fg = palette.bg_3 },
    Visual = { bg = palette.bg_3 },
    VisualNOS = { fg = palette.none, bg = palette.bg_2, fmt = 'underline' },
    QuickFixLine = { fg = palette.blue, fmt = 'underline' },
    Debug = { fg = palette.yellow },
    debugPC = { fg = palette.bg, bg = palette.green },
    debugBreakpoint = { fg = palette.bg, bg = palette.red },
    ToolbarButton = { fg = palette.bg, bg = palette.bg_blue },
    FloatBorder = { fg = palette.gray, bg = palette.bg_1 },
    NormalFloat = { fg = palette.fg, bg = palette.bg_1 },
}

highlights.syntax = {
    ['@diff.plus'] = { fg = palette.green, bg = palette.bg_diff_add },
    ['@diff.minus'] = { fg = palette.red, bg = palette.bg_diff_delete },
    ['@diff.delta'] = { fg = palette.yellow, bg = palette.bg_diff_change },

    ['@text.literal'] = { fg = palette.fg },
    ['@text.reference'] = { fg = palette.fg },
    ['@text.title'] = { fg = palette.violet, fmt = 'bold', aliases = { 'Title' } },
    ['@text.uri'] = { fg = palette.azure, fmt = 'underline' },
    ['@text.underline'] = { fg = palette.fg },
    ['@text.todo'] = { fg = palette.fg, aliases = { 'Todo' } },

    ['@markup.heading'] = { fg = palette.violet, fmt = 'bold' },
    ['@markup.heading.1'] = { fg = palette.teal, fmt = 'bold' },
    ['@markup.heading.2'] = { fg = palette.azure, fmt = 'bold' },
    ['@markup.heading.3'] = { fg = palette.violet, fmt = 'bold' },
    ['@markup.heading.4'] = { fg = palette.fg_3, fmt = 'bold' },

    ['@markup.list'] = { fg = palette.azure },

    ['@markup.list.checked'] = { fg = palette.green },
    ['@markup.list.checked'] = { fg = palette.green },

    ['@markup.link.label'] = { fg = palette.brown },
    ['@markup.link.url'] = { fg = palette.blue },

    ['@markup.strong'] = { fg = palette.fg, fmt = 'bold' },
    ['@markup.italic'] = { fg = palette.fg, fmt = 'italic' },
    ['@markup.underline'] = { fg = palette.fg, fmt = 'underline' },

    ['@markup.quote'] = { fmt = 'italic' },

    ['@markup.raw'] = { bg = palette.bg_1, fg = palette.lily },
    ['@markup.raw.block'] = { fg = palette.lily },

    ['@error'] = { fg = palette.fg, aliases = { 'Error' } },
    ['@comment'] = { fg = palette.fg_4, fmt = 'italic', aliases = { 'Comment', 'SpecialComment' } },
    ['@annotation'] = { fg = palette.fg_2 },
    ['@attribute'] = { fg = palette.fg_2, aliases = { 'Attribute' } },

    ['@punctuation'] = { fg = palette.fg_3 },
    ['@constant'] = { fg = palette.lily, aliases = { 'Constant' } },
    ['@constant.builtin'] = { fg = palette.fg },
    ['@constant.macro'] = { fg = palette.fg },

    ['@define'] = { fg = palette.fg_2, aliases = { 'Define' } },
    ['@macro'] = { fg = palette.fg_2, aliases = { 'Macro' } },
    ['@include'] = { fg = palette.fg_2, aliases = { 'Include' } },
    ['@preproc'] = { fg = palette.fg_2, aliases = { 'PreProc', 'PreCondit' } },
    ['@debug'] = { fg = palette.fg_2 },

    ['@string'] = { fg = palette.brown, aliases = { 'String' } },
    ['@string.escape'] = { fg = palette.yellow },
    ['@string.special'] = { fg = palette.yellow, aliases = { 'Special' } },
    ['@character'] = { fg = palette.yellow, aliases = { 'Character' } },
    ['@character.special'] = { fg = palette.red, aliases = { 'SpecialChar' } },
    ['@boolean'] = { fg = palette.violet, aliases = { 'Boolean' } },
    ['@number'] = { fg = palette.lily, aliases = { 'Number' } },
    ['@float'] = { fg = palette.lily, aliases = { 'Float' } },

    ['@variable'] = { fg = palette.fg, aliases = { 'Identifier' } },
    ['@variable.builtin'] = { fg = palette.magenta },
    ['@field'] = { fg = palette.cloud },
    ['@property'] = { fg = palette.cloud },
    ['@symbol'] = { fg = palette.cloud },

    ['@function'] = { fg = palette.teal, aliases = { 'Function' } },
    ['@function.call'] = { fg = palette.teal },
    ['@function.builtin'] = { fg = palette.violet },
    ['@function.macro'] = { fg = palette.fg_2 },
    ['@parameter'] = { fg = palette.fg_2 },
    ['@method'] = { fg = palette.teal },
    ['@method.call'] = { fg = palette.teal },

    ['@constructor'] = { fg = palette.fg },
    ['@conditional'] = { fg = palette.violet, aliases = { 'Conditional' } },
    ['@repeat'] = { fg = palette.violet, aliases = { 'Repeat' } },
    ['@statement'] = { fg = palette.violet, aliases = { 'Statement' } },
    ['@label'] = { fg = palette.fg, aliases = { 'Label' } },
    ['@operator'] = { fg = palette.fg_1, aliases = { 'Operator' } },
    ['@keyword'] = { fg = palette.violet, aliases = { 'Keyword' } },
    ['@exception'] = { fg = palette.violet, aliases = { 'Exception' } },

    ['@type'] = { fg = palette.azure, aliases = { 'Type' } },
    ['@type.definition'] = { fg = palette.violet, aliases = { 'Typedef' } },
    ['@type.builtin'] = { fg = palette.violet },
    ['@type.qualifier'] = { fg = palette.violet },
    ['@structure'] = { fg = palette.azure, fmt = 'bold', aliases = { 'Structure' } },
    ['@storageclass'] = { fg = palette.violet, aliases = { 'StorageClass' } },

    ['@namespace'] = { fg = palette.blue },

    ['@tag'] = { fg = palette.red, aliases = { 'Tag' } },
    ['@tag.delimiter'] = { fg = palette.fg_3, aliases = { 'TagDelimiter', 'Delimiter' } },
    ['@tag.attribute'] = { fg = palette.yellow },
}

highlights.plugins.lsp = {
    DiagnosticError = { fg = palette.red },
    DiagnosticWarn = { fg = palette.yellow },
    DiagnosticHint = { fg = palette.magenta },
    DiagnosticInfo = { fg = palette.azure },

    DiagnosticVirtualTextError = { fg = palette.red },
    DiagnosticVirtualTextWarn = { fg = palette.yellow },
    DiagnosticVirtualTextHint = { fg = palette.magenta },
    DiagnosticVirtualTextInfo = { fg = palette.azure },

    DiagnosticUnderlineError = { fmt = 'undercurl', sp = palette.red },
    DiagnosticUnderlineHint = { fmt = 'undercurl', sp = palette.violet },
    DiagnosticUnderlineInfo = { fmt = 'undercurl', sp = palette.blue },
    DiagnosticUnderlineWarn = { fmt = 'undercurl', sp = palette.yellow },

    LspReferenceText = { bg = palette.bg_2 },
    LspReferenceWrite = { bg = palette.bg_2 },
    LspReferenceRead = { bg = palette.bg_2 },

    LspCodeLens = { fg = palette.gray, fmt = 'italic' },
    LspCodeLensSeparator = { fg = palette.gray },
}

highlights.plugins.lsp.LspDiagnosticsDefaultError = highlights.plugins.lsp.DiagnosticError
highlights.plugins.lsp.LspDiagnosticsDefaultHint = highlights.plugins.lsp.DiagnosticHint
highlights.plugins.lsp.LspDiagnosticsDefaultInformation = highlights.plugins.lsp.DiagnosticInfo
highlights.plugins.lsp.LspDiagnosticsDefaultWarning = highlights.plugins.lsp.DiagnosticWarn
highlights.plugins.lsp.LspDiagnosticsUnderlineError = highlights.plugins.lsp.DiagnosticUnderlineError
highlights.plugins.lsp.LspDiagnosticsUnderlineHint = highlights.plugins.lsp.DiagnosticUnderlineHint
highlights.plugins.lsp.LspDiagnosticsUnderlineInformation = highlights.plugins.lsp.DiagnosticUnderlineInfo
highlights.plugins.lsp.LspDiagnosticsUnderlineWarning = highlights.plugins.lsp.DiagnosticUnderlineWarn
highlights.plugins.lsp.LspDiagnosticsVirtualTextError = highlights.plugins.lsp.DiagnosticVirtualTextError
highlights.plugins.lsp.LspDiagnosticsVirtualTextWarning = highlights.plugins.lsp.DiagnosticVirtualTextWarn
highlights.plugins.lsp.LspDiagnosticsVirtualTextInformation = highlights.plugins.lsp.DiagnosticVirtualTextInfo
highlights.plugins.lsp.LspDiagnosticsVirtualTextHint = highlights.plugins.lsp.DiagnosticVirtualTextHint


highlights.plugins.cmp = {
    CmpItemAbbr = { fg = palette.fg },
    CmpItemAbbrDeprecated = { fg = palette.fg_5, fmt = 'strikethrough' },
    CmpItemAbbrMatch = { fg = palette.azure },
    CmpItemAbbrMatchFuzzy = { fg = palette.azure, fmt = 'underline' },
    CmpItemMenu = { fg = palette.fg_5 },
    CmpItemKind = { fg = palette.violet },
}

highlights.plugins.neogit = {
        NeogitDiffAdd = { fg = palette.green, bg = palette.bg_diff_add },
        NeogitDiffAddHighlight = { fg = palette.green, bg = palette.bg_diff_add },
        NeogitDiffContex = { fg = palette.fg, bg = palette.bg },
        NeogitDiffContextHighlight = { fg = palette.fg, bg = palette.bg },
        NeogitDiffDelete = { fg = palette.red, bg = palette.bg_diff_delete },
        NeogitDiffDeleteHighlight = { fg = palette.red, bg = palette.bg_diff_delete },
        -- NeogitDiffHeader = { fg = c.vscSplitLight, bg = c.vscBack },
        -- NeogitDiffHeaderHighlight = { fg = c.vscSplitLight, bg = c.vscBack },
        -- NeogitHunkHeader = { fg = c.vscGitModified, bg = c.vscLeftDark },
        -- NeogitHunkHeaderHighlight = { fg = c.vscGitModified, bg = c.vscLeftMid },
}

highlights.plugins.gitsigns = {
    GitSignsAdd = { fg = palette.green },
    GitSignsAddLn = { fg = palette.green },
    GitSignsAddNr = { fg = palette.green },
    GitSignsChange = { fg = palette.violet },
    GitSignsChangeLn = { fg = palette.violet },
    GitSignsChangeNr = { fg = palette.violet },
    GitSignsDelete = { fg = palette.red },
    GitSignsDeleteLn = { fg = palette.red },
    GitSignsDeleteNr = { fg = palette.red },
    GitSignsUntracked = { fg = palette.yellow },
    GitSignsUntrackedLn = { fg = palette.yellow },
    GitSignsUntrackedNr = { fg = palette.yellow }
}

highlights.plugins.nvim_tree = {
    NvimTreeNormal = { fg = palette.fg, bg = palette.bg },
    NvimTreeVertSplit = { fg = palette.bg_2, bg = palette.bg },
    NvimTreeEndOfBuffer = { fg = palette.bg_2, bg = palette.bg },
    NvimTreeRootFolder = { fg = palette.brown, fmt = 'bold' },
    NvimTreeGitDirty = { fg = palette.violet },
    NvimTreeGitNew = { fg = palette.green },
    NvimTreeGitDeleted = { fg = palette.red },
    NvimTreeSpecialFile = { fg = palette.yellow, fmt = 'underline' },
    NvimTreeIndentMarker = { fg = palette.fg },
    NvimTreeImageFile = { fg = palette.violet },
    NvimTreeSymlink = { fg = palette.magenta },
    NvimTreeFolderName = { fg = palette.blue },
}

highlights.plugins.telescope = {
    TelescopeBorder = { fg = palette.fg_1 },
    TelescopePromptBorder = { fg = palette.fg_1 },
    TelescopeResultsBorder = { fg = palette.fg_1 },
    TelescopePreviewBorder = { fg = palette.fg_1 },
    TelescopeMatching = { fg = palette.orange, fmt = 'bold' },
    TelescopePromptPrefix = { fg = palette.lily },
    TelescopeSelection = { bg = palette.accent },
    TelescopeSelectionCaret = { bg = palette.accent, fg = palette.fg },
}

highlights.languages.html = {
    htmlH1 = { fg = palette.teal, fmt = 'bold' },
    htmlH2 = { fg = palette.azure, fmt = 'bold' },
    htmlH3 = { fg = palette.violet, fmt = 'bold' }
}

function M.setup(options)

    local default_highlights = options.highlights or {}

    set(highlights.editor, default_highlights)
    set(highlights.syntax, default_highlights)

    for _, language_highlights in pairs(highlights.languages) do
	set(language_highlights, default_highlights)
    end

    for _, plugin_highlights in pairs(highlights.plugins) do
	set(plugin_highlights, default_highlights)
    end
end

return M
