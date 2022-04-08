require('telescope').load_extension('aerial')
require("aerial").setup({
  on_attach = function(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-t>', '<cmd>AerialToggle!<CR>', {})
  end
})
