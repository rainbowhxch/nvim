require'telescope'.load_extension('project')
local utils = require('utils')
utils.nnoremap('<LEADER>fw', '<CMD>Telescope project<CR>')
