-- zen-mode.nvim
require("zen-mode").setup{}
local utils = require('utils')
utils.nnoremap('<LEADER>zm', '<CMD>ZenMode<CR>')
