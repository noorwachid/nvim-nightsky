local M = {}
local palette = require('nightsky.palette')

function M.setup()
    vim.g.terminal_color_0 = palette.gray
    vim.g.terminal_color_1 = palette.red
    vim.g.terminal_color_2 = palette.green
    vim.g.terminal_color_3 = palette.yellow
    vim.g.terminal_color_4 = palette.blue
    vim.g.terminal_color_5 = palette.magenta
    vim.g.terminal_color_6 = palette.cyan
    vim.g.terminal_color_7 = palette.fg

    vim.g.terminal_color_8 = palette.gray
    vim.g.terminal_color_9 = palette.red
    vim.g.terminal_color_10 = palette.green
    vim.g.terminal_color_11 = palette.yellow
    vim.g.terminal_color_12 = palette.blue
    vim.g.terminal_color_13 = palette.magenta
    vim.g.terminal_color_14 = palette.cyan
    vim.g.terminal_color_15 = palette.fg
end

return M
