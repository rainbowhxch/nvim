-- undotree.vim
local utils = require('utils')
utils.nnoremap('U', '<CMD>UndotreeToggle<CR>')
vim.cmd([[
    function! g:Undotree_CustomMap()
        nmap <buffer> J <plug>UndotreeNextState
        nmap <buffer> K <plug>UndotreePreviousState
    endfunc
]])
