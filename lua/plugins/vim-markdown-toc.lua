-- vim-markdown-toc
local utils = require('utils')
utils.nnoremap('<LEADER>tc', '<CMD>GenTocGFM<CR>')
vim.g.vmt_auto_update_on_save = 1
vim.g.vmt_dont_insert_fence = 0
vim.g.vmt_cycle_list_item_markers = 1
vim.g.vmt_include_headings_before = 0
vim.g.vmt_fence_text = 'TOC'
vim.g.vmt_fence_closing_text = '/TOC'
