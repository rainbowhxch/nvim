local utils = require('utils')
require('treesj').setup{
  use_default_keymaps = false,
  max_join_length = 50000,
}
utils.nnoremap('gJ', '<CMD>TSJToggle<CR>')
