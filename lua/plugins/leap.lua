local utils = require('utils')
utils.nnoremap('s', '<CMD>lua require("leap").leap { target_windows = { vim.fn.win_getid() } }<CR>')
utils.vnoremap('s', '<CMD>lua require("leap").leap { target_windows = { vim.fn.win_getid() } }<CR>')
