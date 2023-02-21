vim9script

hi clear

if exists('syntax_on')
	syntax reset
endif

g:colors_name = 'nightsky'

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

def H(group: string, props: dict<any>)
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
H('Normal', { fg: palette.fg, bg: palette.bg })
H('Terminal', { fg: palette.fg, bg: palette.bg })
H('EndOfBuffer', { fg: palette.bg, bg: palette.bg })
H('FoldColumn', { fg: palette.fg, bg: palette.bg_1 })
H('Folded', { fg: palette.fg, bg: palette.bg_1 })
H('SignColumn', { fg: palette.fg, bg: palette.bg })
H('ToolbarLine', { fg: palette.fg })
H('CursorColumn', { bg: palette.bg_1 })
H('CursorLine', { bg: palette.bg_1, fmt: 'NONE' })
H('ColorColumn', { bg: palette.bg_1 })
H('CursorLineNr', { fg: palette.fg, fmt: 'bold' })
H('LineNr', { fg: palette.gray })
H('Conceal', { fg: palette.gray, bg: palette.bg_1 })
H('DiffAdd', { fg: palette.none_, bg: palette.bg_diff_add })
H('DiffChange', { fg: palette.none_, bg: palette.bg_diff_change })
H('DiffDelete', { fg: palette.none_, bg: palette.bg_diff_delete })
H('DiffText', { fg: palette.none_, bg: palette.bg_diff_info })
H('DiffAdded', { fg: palette.green })
H('DiffRemoved', { fg: palette.red })
H('DiffFile', { fg: palette.cyan })
H('DiffIndexLine', { fg: palette.gray })
H('Directory', { fg: palette.blue })
H('ErrorMsg', { fg: palette.red, fmt: 'bold' })
H('WarningMsg', { fg: palette.yellow, fmt: 'bold' })
H('MoreMsg', { fg: palette.blue, fmt: 'bold' })
H('IncSearch', { fg: palette.bg, bg: palette.orange })
H('Search', { fg: palette.fg, bg: palette.accent_darker })
H('Substitute', { fg: palette.bg, bg: palette.green })
H('MatchParen', { fg: palette.yellow, fmt: 'bold' })
H('NonText', { fg: palette.gray })
H('Whitespace', { fg: palette.gray })
H('SpecialKey', { fg: palette.gray })
H('Pmenu', { fg: palette.fg, bg: palette.bg_2 })
H('PmenuSbar', { fg: palette.none_, bg: palette.bg_1 })
H('PmenuSel', { fg: palette.fg, bg: palette.accent })
H('PmenuThumb', { fg: palette.none_, bg: palette.gray })
H('WildMenu', { fg: palette.bg, bg: palette.blue })
H('Question', { fg: palette.yellow })
H('SpellBad', { fg: palette.red, fmt: 'underline', sp: palette.red })
H('SpellCap', { fg: palette.yellow, fmt: 'underline', sp: palette.yellow })
H('SpellLocal', { fg: palette.blue, fmt: 'underline', sp: palette.blue })
H('SpellRare', { fg: palette.violet, fmt: 'underline', sp: palette.violet })
H('StatusLine', { fg: palette.fg, bg: palette.accent_darker })
H('StatusLineNC', { fg: palette.gray, bg: palette.bg_2 })
H('StatusLineTerm', { fg: palette.fg, bg: palette.accent_darker })
H('StatusLineTermNC', { fg: palette.gray, bg: palette.bg_2 })
H('TabLine', { fg: palette.fg, bg: palette.bg_1 })
H('TabLineFill', { fg: palette.gray, bg: palette.bg_1 })
H('TabLineSel', { fg: palette.bg, bg: palette.fg })
H('VertSplit', { fg: palette.bg_3, bg: 'NONE' })
H('Visual', { bg: palette.bg_3 })
H('VisualNOS', { fg: palette.none_, bg: palette.bg_2, fmt: 'underline' })
H('QuickFixLine', { fg: palette.blue, fmt: 'underline' })
H('Debug', { fg: palette.yellow })
H('DebugPC', { fg: palette.bg, bg: palette.green })
H('DebugBreakpoint', { fg: palette.bg, bg: palette.red })
H('ToolbarButton', { fg: palette.bg, bg: palette.bg_1 })
H('FloatBorder', { fg: palette.gray, bg: palette.bg_1 })
H('NormalFloat', { fg: palette.fg, bg: palette.bg_1 })

# Syntax
H('Title', { fg: palette.violet, fmt: 'bold' })
H('Todo', { fg: palette.yellow, bg: 'NONE', fmt: 'bold' })
H('Error', { fg: palette.red, bg: 'NONE', fmt: 'bold' })
H('Comment', { fg: palette.fg_4, fmt: 'italic' })
H('SpecialComment', { fg: palette.fg_4, fmt: 'italic' })

H('Constant', { fg: palette.lily })

H('Delimiter', { fg: palette.fg_2 })
H('String', { fg: palette.brown })
H('Special', { fg: palette.violet })
H('Character', { fg: palette.yellow })
H('SpecialChar', { fg: palette.red })
H('Boolean', { fg: palette.violet })
H('Number', { fg: palette.lily })
H('Float', { fg: palette.lily })

H('Identifier', { fg: palette.fg })
H('Function', { fg: palette.teal })

H('Conditional', { fg: palette.violet })
H('Repeat', { fg: palette.violet })
H('Statement', { fg: palette.violet })
H('Label', { fg: palette.violet })
H('Operator', { fg: palette.fg_1 })
H('Keyword', { fg: palette.violet })
H('Exception', { fg: palette.violet })

H('Define', { fg: palette.fg_2 })
H('Macro', { fg: palette.fg_2 })
H('Include', { fg: palette.fg_2 })
H('PreProc', { fg: palette.fg_2 })
H('PreCondit', { fg: palette.fg_2 })

H('Type', { fg: palette.azure })
H('Typedef', { fg: palette.violet })
H('Structure', { fg: palette.azure, fmt: 'bold' })
H('StorageClass', { fg: palette.violet })
H('Tag', { fg: palette.red })
H('TagDelimiter', { fg: palette.fg_2 })

# Language Specific
