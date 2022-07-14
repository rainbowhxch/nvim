-- copilot.vim
local utils = require('utils')
utils.inoremap_with_expr('<C-Space>', 'copilot#Accept("\\<CR>")')
vim.g.copilot_no_tab_map = true
