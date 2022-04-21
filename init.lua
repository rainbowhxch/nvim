vim.g.mapleader = ' '

require('user.options')
require('user.autocommand')
require('user.highlight')
require('user.mapping')
require('user.packer')
require('colorschemes.nightfox')
require('lsp')

require('beacon').setup({
    ignore_buffers = {'init.lua'},
    ignore_filetypes = {'cpp'},
})
