-- vista.vim
local utils = require('utils')
vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}
vim.g.vista_default_executive = 'nvim_lsp'
vim.g['vista#renderer#enable_icon'] = 1
utils.nnoremap('<C-t>', '<CMD>Vista!!<CR>')
