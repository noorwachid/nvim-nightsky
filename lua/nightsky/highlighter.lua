local palette = require('nightsky.palette')

local M = {}
local highlights = {
    plugins = {}
}

local function set(new_highlights)
    for group, options in pairs(new_highlights) do
        local attributes_command = string.format('guifg=%s guibg=%s guisp=%s gui=%s',
            options.fg or 'none',
            options.bg or 'none',
            options.sp or 'none',
            options.fmt or 'none'
        )

        vim.api.nvim_command('hi ' .. group .. ' ' .. attributes_command)

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
    FoldColumn = { fg = palette.fg, bg = palette.bg_1 },
    Folded = { fg = palette.fg, bg = palette.bg_1 },
    SignColumn = { fg = palette.fg, bg = palette.bg },
    ToolbarLine = { fg = palette.fg },
    Cursor = { fmt = "reverse" },
    vCursor = { fmt = "reverse" },
    iCursor = { fmt = "reverse" },
    lCursor = { fmt = "reverse" },
    CursorIM = { fmt = "reverse" },
    CursorColumn = { bg = palette.bg_1 },
    CursorLine = { bg = palette.bg_1 },
    ColorColumn = { bg = palette.bg_1 },
    CursorLineNr = { fg = palette.fg, fmt = 'bold' },
    LineNr = { fg = palette.gray },
    Conceal = { fg = palette.gray, bg = palette.bg_1 },
    DiffAdd = { fg = palette.none, bg = palette.bg_diff_add },
    DiffChange = { fg = palette.none, bg = palette.bg_diff_change },
    DiffDelete = { fg = palette.none, bg = palette.bg_diff_delete },
    DiffText = { fg = palette.none, bg = palette.bg_diff_info },
    DiffAdded = { fg = palette.green },
    DiffRemoved = { fg = palette.red },
    DiffFile = { fg = palette.cyan },
    DiffIndexLine = { fg = palette.gray },
    Directory = { fg = palette.blue },
    ErrorMsg = { fg = palette.red, fmt = "bold" },
    WarningMsg = { fg = palette.yellow, fmt = "bold" },
    MoreMsg = { fg = palette.blue, fmt = "bold" },
    IncSearch = { fg = palette.bg, bg = palette.orange },
    Search = { fg = palette.bg, bg = palette.accent_darker },
    Substitute = { fg = palette.bg, bg = palette.green },
    MatchParen = { fg = palette.none, bg = palette.gray },
    NonText = { fg = palette.gray },
    Whitespace = { fg = palette.gray },
    SpecialKey = { fg = palette.gray },
    Pmenu = { fg = palette.fg, bg = palette.bg_2 },
    PmenuSbar = { fg = palette.none, bg = palette.bg_1 },
    PmenuSel = { fg = palette.fg, bg = palette.accent },
    PmenuThumb = { fg = palette.none, bg = palette.gray },
    WildMenu = { fg = palette.bg, bg = palette.blue },
    Question = { fg = palette.yellow },
    SpellBad = { fg = palette.red, fmt = "underline", sp = palette.red },
    SpellCap = { fg = palette.yellow, fmt = "underline", sp = palette.yellow },
    SpellLocal = { fg = palette.blue, fmt = "underline", sp = palette.blue },
    SpellRare = { fg = palette.violet, fmt = "underline", sp = palette.violet },
    StatusLine = { fg = palette.fg, bg = palette.accent_darker },
    StatusLineNC = { fg = palette.gray, bg = palette.bg_2 },
    StatusLineTerm = { fg = palette.fg, bg = palette.accent_darker },
    StatusLineTermNC = { fg = palette.gray, bg = palette.bg_2 },
    TabLine = { fg = palette.fg, bg = palette.bg_1 },
    TabLineFill = { fg = palette.gray, bg = palette.bg_1 },
    TabLineSel = { fg = palette.bg, bg = palette.fg },
    VertSplit = { fg = palette.bg_3 },
    Visual = { bg = palette.bg_3 },
    VisualNOS = { fg = palette.none, bg = palette.bg_2, fmt = "underline" },
    QuickFixLine = { fg = palette.blue, fmt = "underline" },
    Debug = { fg = palette.yellow },
    debugPC = { fg = palette.bg, bg = palette.green },
    debugBreakpoint = { fg = palette.bg, bg = palette.red },
    ToolbarButton = { fg = palette.bg, bg = palette.bg_blue },
    FloatBorder = { fg = palette.gray, bg = palette.bg_1 },
    NormalFloat = { fg = palette.fg, bg = palette.bg_1 },
}

highlights.syntax = {
    ['@text.literal'] = { fg = palette.fg },
    ['@text.reference'] = { fg = palette.fg },
    ['@text.title'] = { fg = palette.fg },
    ['@text.uri'] = { fg = palette.fg },
    ['@text.underline'] = { fg = palette.fg },
    ['@text.todo'] = { fg = palette.fg },

    ['@comment'] = { fg = palette.fg_4, fmt = 'italic' },
    ['@annotation'] = { fg = palette.fg_2 },
    ['@attribute'] = { fg = palette.fg_2 },

    ['@punctuation'] = { fg = palette.fg },
    ['@constant'] = { fg = palette.fg },
    ['@constant.builtin'] = { fg = palette.fg },
    ['@constant.macro'] = { fg = palette.fg },

    ['@define'] = { fg = palette.fg_2 },
    ['@macro'] = { fg = palette.fg_2 },
    ['@include'] = { fg = palette.fg_2 },
    ['@preproc'] = { fg = palette.fg_2 },
    ['@debug'] = { fg = palette.fg_2 },

    ['@string'] = { fg = palette.brown },
    ['@string.escape'] = { fg = palette.yellow },
    ['@string.special'] = { fg = palette.orange },
    ['@character'] = { fg = palette.yellow },
    ['@character.special'] = { fg = palette.red },
    ['@boolean'] = { fg = palette.violet },
    ['@number'] = { fg = palette.lily },
    ['@float'] = { fg = palette.lily },

    ['@variable'] = { fg = palette.fg },
    ['@variable.builtin'] = { fg = palette.magenta },
    ['@field'] = { fg = palette.cloud },
    ['@property'] = { fg = palette.cloud },

    ['@function'] = { fg = palette.teal },
    ['@function.builtin'] = { fg = palette.fg },
    ['@function.macro'] = { fg = palette.fg },
    ['@parameter'] = { fg = palette.fg_2 },
    ['@method'] = { fg = palette.teal },

    ['@constructor'] = { fg = palette.fg },
    ['@conditional'] = { fg = palette.violet },
    ['@repeat'] = { fg = palette.violet },
    ['@label'] = { fg = palette.fg },
    ['@operator'] = { fg = palette.fg_1 },
    ['@keyword'] = { fg = palette.violet },
    ['@exception'] = { fg = palette.violet },

    ['@type'] = { fg = palette.azure },
    ['@type.builtin'] = { fg = palette.violet },
    ['@type.definition'] = { fg = palette.fg },
    ['@structure'] = { fg = palette.azure, aliases = { 'Structure', 'Type' } },
    ['@storageclass'] = { fg = palette.fg },

    ['@namespace'] = { fg = palette.blue },

    ['@tag'] = { fg = palette.fg },
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
    CmpItemAbbrDeprecated = { fg = palette.fg_5, fmt = "strikethrough" },
    CmpItemAbbrMatch = { fg = palette.azure },
    CmpItemAbbrMatchFuzzy = { fg = palette.azure, fmt = "underline" },
    CmpItemMenu = { fg = palette.fg_5 },
    CmpItemKind = { fg = palette.violet },
}

highlights.plugins.gitsigns = {
    GitSignsAdd = { fg = palette.green },
    GitSignsAddLn = { fg = palette.green },
    GitSignsAddNr = { fg = palette.green },
    GitSignsChange = { fg = palette.blue },
    GitSignsChangeLn = { fg = palette.blue },
    GitSignsChangeNr = { fg = palette.blue },
    GitSignsDelete = { fg = palette.red },
    GitSignsDeleteLn = { fg = palette.red },
    GitSignsDeleteNr = { fg = palette.red }
}

highlights.plugins.nvim_tree = {
    NvimTreeNormal = { fg = palette.fg, bg = palette.bg },
    NvimTreeVertSplit = { fg = palette.bg_2, bg = palette.bg },
    NvimTreeEndOfBuffer = { fg = palette.bg_2, bg = palette.bg },
    NvimTreeRootFolder = { fg = palette.brown, fmt = "bold" },
    NvimTreeGitDirty = { fg = palette.blue },
    NvimTreeGitNew = { fg = palette.green },
    NvimTreeGitDeleted = { fg = palette.red },
    NvimTreeSpecialFile = { fg = palette.yellow, fmt = "underline" },
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
    TelescopeMatching = { fg = palette.orange, fmt = "bold" },
    TelescopePromptPrefix = { fg = palette.lily },
    TelescopeSelection =  { bg = palette.accent },
    TelescopeSelectionCaret = { bg = palette.accent, fg = palette.fg },
}

function M.setup()
    set(highlights.editor)
    set(highlights.syntax)

    for _, plugin_highlights in pairs(highlights.plugins) do
        set(plugin_highlights)
    end
end

return M
