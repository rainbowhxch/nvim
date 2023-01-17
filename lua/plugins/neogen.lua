-- neogen
local utils = require("utils")
require('neogen').setup{}
utils.nnoremap("<Leader>gc", ":lua require('neogen').generate()<CR>")
require('telescope').load_extension('neoclip')
