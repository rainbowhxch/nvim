require('session_manager').setup({
  autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir
})
local utils = require('utils')
utils.nnoremap('<LEADER>wp', '<CMD>SessionManager load_session<CR>')
utils.nnoremap('<LEADER>ws', '<CMD>SessionManager save_session<CR>')
utils.nnoremap('<LEADER>wd', '<CMD>SessionManager delete_session<CR>')
