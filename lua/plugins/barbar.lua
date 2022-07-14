-- barbar.nvim
local utils = require('utils')
utils.nnoremap('gb', '<Cmd>BufferPick<CR>')
utils.nnoremap(']b', '<Cmd>BufferNext<CR>')
utils.nnoremap('[b', '<Cmd>BufferPrevious<CR>')
utils.nnoremap('H', '<Cmd>BufferClose<CR>')
