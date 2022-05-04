local utils = require('utils')
utils.nnoremap('<LEADER>um', require'nvim-picgo'.upload_imagefile)
utils.nnoremap('<LEADER>uc', require'nvim-picgo'.upload_clipboard)
