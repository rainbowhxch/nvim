-- nvim-spectre
local utils = require('utils')
utils.nnoremap('<LEADER>S', '<CMD>lua require(\'spectre\').open()<CR>')
