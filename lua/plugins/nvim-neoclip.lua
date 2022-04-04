-- nvim-neoclip.lua
require('neoclip').setup()
local utils = require('utils')
utils.nnoremap('<LEADER>fy', '<CMD>Telescope neoclip<CR>')
