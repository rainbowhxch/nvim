-- vim-surround
local utils = require('utils')
utils.nmap('<LEADER>"', 'ysiW"')
utils.nmap('<LEADER>\'', 'ysiW\'')
utils.nmap('<LEADER>(', 'ysiW)')
utils.nmap('<LEADER>{', 'ysiW{')
utils.nmap('<LEADER>[', 'ysiW[')
utils.nmap('<LEADER>/', 'ysiW*ysiW/f*a<SPACE><ESC>f*i<SPACE><ESC>b')
