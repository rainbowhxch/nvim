-- vim-vsnip
local utils = require('utils')
local vsnip_path = vim.fn.stdpath('config') .. '/snippets/'
vim.g.vsnip_snippet_dir = vsnip_path
utils.nnoremap('gs', '<CMD>VsnipOpenSplit<CR>')
utils.imap_with_expr('<C-j>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"')
utils.smap_with_expr('<C-j>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"')
utils.imap_with_expr('<C-k>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-k>"')
utils.smap_with_expr('<C-k>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-k>"')
