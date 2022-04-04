
-- toggleterm.nvim
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  dir = "git_dir",
  direction = "float",
  cmd = "lazygit",
  hidden = true
})
function _LazygitToggle()
  lazygit:toggle()
end
local utils = require('utils')
utils.nnoremap('<LEADER>gi', '<CMD>lua _LazygitToggle()<CR>')
utils.nnoremap('<F1>', '<CMD>ToggleTerm direction="float"<CR>')
utils.tnoremap('<F1>', '<CMD>ToggleTerm direction="float"<CR>')
require("toggleterm").setup{
  open_mapping = [[<C-\>]],
  direction = 'horizontal',
}
