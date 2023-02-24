local M = {}

function M.setup(options)
	options = options or {}

    vim.cmd('hi clear')
    vim.cmd('syntax reset')

    require('nightsky.highlighter').setup(options)
    -- require('midnightstar.terminal').setup()
end

return M

