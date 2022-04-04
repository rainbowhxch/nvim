-- vim-bookmarks
local utils = require('utils')
vim.g.bookmark_sign = ''
vim.g.bookmark_annotation_sign = '☰'
vim.g.bookmark_no_default_key_mappings = 1
utils.nmap('<LEADER>mt', '<Plug>BookmarkToggle')
utils.nmap('<LEADER>ma', '<Plug>BookmarkAnnotate')
utils.nmap('<LEADER>mm', '<Plug>BookmarkShowAll')
utils.nmap(']m', '<Plug>BookmarkNext')
utils.nmap('[m', '<Plug>BookmarkPrev')
utils.nmap('<LEADER>mc', '<Plug>BookmarkClear')
utils.nmap('<LEADER>mC', '<Plug>BookmarkClearAll')
