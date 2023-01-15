local M = {}

function M.setup()
    vim.cmd('hi clear')
    vim.cmd('syntax reset')

    require('nightsky.highlighter').setup()
    -- require('midnightstar.terminal').setup()
end

return M

