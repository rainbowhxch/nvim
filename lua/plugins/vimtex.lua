-- VimTex
local cache_dir = vim.env.HOME .. '/.cache/nvim/'
vim.g.vimtex_mappings_enabled = 0
vim.g.vimtex_cache_root = cache_dir .. 'vimtex'
vim.g.tex_flavor = 'latex'
vim.g.vimtex_toc_enabled = 0
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_view_method = 'zathura'
