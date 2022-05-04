require('auto-session').setup {}
require("telescope").load_extension("session-lens")
require('session-lens').setup({})
local utils = require('utils')
utils.nnoremap('<LEADER>fw', require('session-lens').search_session)
