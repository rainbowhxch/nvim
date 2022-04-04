-- todo-comments.nvim
require("todo-comments").setup{}
local utils = require('utils')
utils.nnoremap('<LEADER>td', '<CMD>TodoTelescope<CR>')
