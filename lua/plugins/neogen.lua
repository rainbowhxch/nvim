-- neogen
local utils = require("utils")
require('neogen').setup{}
utils.nnoremap("<Leader>gF", ":lua require('neogen').generate({type='file'})<CR>")
utils.nnoremap("<Leader>gc", ":lua require('neogen').generate({type='class'})<CR>")
utils.nnoremap("<Leader>gf", ":lua require('neogen').generate({type='func'})<CR>")
require('telescope').load_extension('neoclip')
