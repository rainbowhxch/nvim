-- nvim-neoclip.lua
require('neoclip').setup({
  enable_persistent_history = false,
  keys = {
    telescope = {
      i = {
        select = nil,
        paste = '<cr>',
      },
    },
  },
})
require('telescope').load_extension('neoclip')
local utils = require('utils')
utils.nnoremap('<LEADER>fy', '<CMD>Telescope neoclip<CR>')
