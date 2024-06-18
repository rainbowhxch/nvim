-- nvim-neoclip.lua
require('neoclip').setup()
require('telescope').load_extension('neoclip')
local utils = require('utils')
utils.nnoremap('<LEADER>fy', '<CMD>Telescope neoclip<CR>')
