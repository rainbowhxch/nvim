-- nvim-tree
local utils = require('utils')
utils.nnoremap('<LEADER>n', '<CMD>NvimTreeToggle<CR>')
require'nvim-tree'.setup({
  actions = {
    open_file = {
      quit_on_open = true;
    }
  }
})
