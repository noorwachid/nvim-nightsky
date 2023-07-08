vim9script

var palette = {
	none_: 'NONE',
    fg: '#d1d1d3',
    fg_1: '#c1c1c1',
    fg_2: '#bbbbbb',
    fg_3: '#aaaaaa',
    fg_4: '#999999',
    fg_5: '#888888',

    bg: '#181819',
    bg_1: '#2c2b2b',
    bg_2: '#313131',
    bg_3: '#3f3f3f',
    bg_4: '#444444',
    bg_5: '#555555',

    bg_diff_info: '#515151',
    bg_diff_add: '#003300',
    bg_diff_change: '#220066',
    bg_diff_delete: '#330000',

    red: '#ef5a5c',
    orange: '#ef7820',
    brown: '#da9387',
    yellow: '#efcf80',
    chartreuse: '#98cf90',
    green: '#32ee30',
    teal: '#2ae3cd',
    cyan: '#96e6e2',
    azure: '#31cff1',
    cloud: '#c1c1ef',
    blue: '#43b8ff',
    violet: '#8a8cef',
    lily: '#b8a3ff',
    magenta: '#b888ef',
    heliconia: '#ef4098',

    black: '#2c2b2b',
    gray: '#abb2bf',
    white: '#d1d1d3',

    accent: '#6833ff',
    accent_darker: '#5511dd',
}

def Hi(group: string, props: dict<any>)
	var hq = 'hi ' .. group

	if props->has_key('fg')
		# hq = hq .. ' ctermfg=' .. props.fg
		hq = hq .. ' guifg=' .. props.fg
	else 
		hq = hq .. ' ctermfg=NONE'
		hq = hq .. ' guifg=NONE'
	endif

	if props->has_key('bg')
		# hq = hq .. ' ctermbg=' .. props.bg
		hq = hq .. ' guibg=' .. props.bg
	else 
		hq = hq .. ' ctermbg=NONE'
		hq = hq .. ' guibg=NONE'
	endif

	if props->has_key('fmt')
		hq = hq .. ' cterm=' .. props.fmt
		hq = hq .. ' gui=' .. props.fmt
	else 
		hq = hq .. ' cterm=NONE'
		hq = hq .. ' gui=NONE'
	endif

	exec hq
enddef

# UI 
Hi('Normal', { fg: palette.fg, bg: palette.bg })
Hi('Terminal', { fg: palette.fg, bg: palette.bg })
Hi('EndOfBuffer', { fg: palette.bg, bg: palette.bg })
Hi('FoldColumn', { fg: palette.fg, bg: palette.bg_1 })
Hi('Folded', { fg: palette.fg, bg: palette.bg_1 })
Hi('SignColumn', { fg: palette.fg, bg: palette.bg })
Hi('ToolbarLine', { fg: palette.fg })
Hi('CursorColumn', { bg: palette.bg_1 })
Hi('CursorLine', { bg: palette.bg_1, fmt: 'NONE' })
Hi('ColorColumn', { bg: palette.bg_1 })
Hi('CursorLineNr', { fg: palette.fg, fmt: 'bold' })
Hi('LineNr', { fg: palette.gray })
Hi('Conceal', { fg: palette.gray, bg: palette.bg_1 })
Hi('DiffAdd', { fg: palette.none_, bg: palette.bg_diff_add })
Hi('DiffChange', { fg: palette.none_, bg: palette.bg_diff_change })
Hi('DiffDelete', { fg: palette.none_, bg: palette.bg_diff_delete })
Hi('DiffText', { fg: palette.none_, bg: palette.bg_diff_info })
Hi('DiffAdded', { fg: palette.green })
Hi('DiffRemoved', { fg: palette.red })
Hi('DiffFile', { fg: palette.cyan })
Hi('DiffIndexLine', { fg: palette.gray })
Hi('Directory', { fg: palette.blue })
Hi('ErrorMsg', { fg: palette.red, fmt: 'bold' })
Hi('WarningMsg', { fg: palette.yellow, fmt: 'bold' })
Hi('MoreMsg', { fg: palette.blue, fmt: 'bold' })
Hi('IncSearch', { fg: palette.bg, bg: palette.orange })
Hi('Search', { fg: palette.fg, bg: palette.accent_darker })
Hi('Substitute', { fg: palette.bg, bg: palette.green })
Hi('MatchParen', { fg: palette.yellow, fmt: 'bold' })
Hi('NonText', { fg: palette.gray })
Hi('Whitespace', { fg: palette.gray })
Hi('SpecialKey', { fg: palette.gray })
Hi('Pmenu', { fg: palette.fg, bg: palette.bg_2 })
Hi('PmenuSbar', { fg: palette.none_, bg: palette.bg_1 })
Hi('PmenuSel', { fg: palette.fg, bg: palette.accent })
Hi('PmenuThumb', { fg: palette.none_, bg: palette.gray })
Hi('WildMenu', { fg: palette.bg, bg: palette.blue })
Hi('Question', { fg: palette.yellow })
Hi('SpellBad', { fg: palette.red, fmt: 'underline', sp: palette.red })
Hi('SpellCap', { fg: palette.yellow, fmt: 'underline', sp: palette.yellow })
Hi('SpellLocal', { fg: palette.blue, fmt: 'underline', sp: palette.blue })
Hi('SpellRare', { fg: palette.violet, fmt: 'underline', sp: palette.violet })
Hi('StatusLine', { fg: palette.fg, bg: palette.accent_darker })
Hi('StatusLineNC', { fg: palette.gray, bg: palette.bg_2 })
Hi('StatusLineTerm', { fg: palette.fg, bg: palette.accent_darker })
Hi('StatusLineTermNC', { fg: palette.gray, bg: palette.bg_2 })
Hi('TabLine', { fg: palette.fg, bg: palette.bg_1 })
Hi('TabLineFill', { fg: palette.gray, bg: palette.bg_1 })
Hi('TabLineSel', { fg: palette.bg, bg: palette.fg })
Hi('VertSplit', { fg: palette.bg_3, bg: 'NONE' })
Hi('Visual', { bg: palette.bg_3 })
Hi('VisualNOS', { fg: palette.none_, bg: palette.bg_2, fmt: 'underline' })
Hi('QuickFixLine', { fg: palette.blue, fmt: 'underline' })
Hi('Debug', { fg: palette.yellow })
Hi('DebugPC', { fg: palette.bg, bg: palette.green })
Hi('DebugBreakpoint', { fg: palette.bg, bg: palette.red })
Hi('ToolbarButton', { fg: palette.bg, bg: palette.bg_1 })
Hi('FloatBorder', { fg: palette.gray, bg: palette.bg_1 })
Hi('NormalFloat', { fg: palette.fg, bg: palette.bg_1 })

# Syntax
Hi('Title', { fg: palette.violet, fmt: 'bold' })
Hi('Todo', { fg: palette.yellow, bg: 'NONE', fmt: 'bold' })
Hi('Error', { fg: palette.red, bg: 'NONE', fmt: 'bold' })
Hi('Comment', { fg: palette.fg_4, fmt: 'italic' })
Hi('SpecialComment', { fg: palette.fg_4, fmt: 'italic' })

Hi('Constant', { fg: palette.lily })

Hi('Delimiter', { fg: palette.fg_2 })
Hi('String', { fg: palette.brown })
Hi('Special', { fg: palette.violet })
Hi('Character', { fg: palette.yellow })
Hi('SpecialChar', { fg: palette.red })
Hi('Boolean', { fg: palette.violet })
Hi('Number', { fg: palette.lily })
Hi('Float', { fg: palette.lily })

Hi('Identifier', { fg: palette.fg })
Hi('Function', { fg: palette.teal })

Hi('Conditional', { fg: palette.violet })
Hi('Repeat', { fg: palette.violet })
Hi('Statement', { fg: palette.violet })
Hi('Label', { fg: palette.violet })
Hi('Operator', { fg: palette.fg_1 })
Hi('Keyword', { fg: palette.violet })
Hi('Exception', { fg: palette.violet })

Hi('Define', { fg: palette.fg_2 })
Hi('Macro', { fg: palette.fg_2 })
Hi('Include', { fg: palette.fg_2 })
Hi('PreProc', { fg: palette.fg_2 })
Hi('PreCondit', { fg: palette.fg_2 })

Hi('Type', { fg: palette.azure })
Hi('Typedef', { fg: palette.violet })
Hi('Structure', { fg: palette.azure, fmt: 'bold' })
Hi('StorageClass', { fg: palette.violet })
Hi('Tag', { fg: palette.red })
Hi('TagDelimiter', { fg: palette.fg_2 })

# Diagnostic

Hi('DiagnosticError', { fg: palette.red })
Hi('DiagnosticWarn', { fg: palette.yellow })
Hi('DiagnosticHint', { fg: palette.magenta })
Hi('DiagnosticInfo', { fg: palette.azure })

Hi('DiagnosticVirtualTextError', { fg: palette.red })
Hi('DiagnosticVirtualTextWarn', { fg: palette.yellow })
Hi('DiagnosticVirtualTextHint', { fg: palette.magenta })
Hi('DiagnosticVirtualTextInfo', { fg: palette.azure })

Hi('DiagnosticUnderlineError', { fmt: 'undercurl', sp: palette.red })
Hi('DiagnosticUnderlineHint', { fmt: 'undercurl', sp: palette.violet })
Hi('DiagnosticUnderlineInfo', { fmt: 'undercurl', sp: palette.blue })
Hi('DiagnosticUnderlineWarn', { fmt: 'undercurl', sp: palette.yellow })

# Language Specific

Hi('htmlH1', { fg: palette.azure, fmt: 'bold' })
Hi('htmlH2', { fg: palette.teal, fmt: 'bold' })
Hi('htmlH3', { fg: palette.violet, fmt: 'bold' })


