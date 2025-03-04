-- lualine.nvim
-- require('bubbles')
local nvim_tree_shift =  {
  function ()
    return string.rep(' ',
                      vim.api.nvim_win_get_width(require'nvim-tree.view'.get_winnr()) - 1)
  end,
  cond = require('nvim-tree.view').is_visible,
  color = 'NvimTreeNormal'
}
local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

require("lualine").setup({
  options = {
    theme = 'auto',
    section_separators = '',
    component_separators = ''
  },
  sections = {
    lualine_a = { nvim_tree_shift, "mode" },
    lualine_b = { {'diff', source = diff_source}, },
  },
})
