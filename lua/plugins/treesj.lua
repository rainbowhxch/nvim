local utils = require('utils')
require('treesj').setup{
  use_default_keymaps = false,
  max_join_length = 500,
}
utils.nnoremap('gJ', '<CMD>TSJToggle<CR>')
