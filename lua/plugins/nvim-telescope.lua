-- nvim-telescope
local utils = require('utils')
local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    -- set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default + actions.center
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<space>"] = actions.toggle_selection,
        ["<V>"] = actions.toggle_all,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      }
    }
  },
}
utils.nnoremap('<LEADER>ff', '<CMD>Telescope find_files<CR>')
utils.nnoremap('<LEADER>fg', '<CMD>Telescope git_files<CR>')
utils.nnoremap('<LEADER>fb', '<CMD>Telescope buffers<CR>')
utils.nnoremap('<LEADER>fc', '<CMD>Telescope colorscheme<CR>')
utils.nnoremap('<LEADER>fs', '<CMD>Telescope current_buffer_fuzzy_find<CR>')
utils.nnoremap('<LEADER>fS', '<CMD>Telescope grep_string<CR>')
utils.nnoremap('<LEADER>fw', '<CMD>Telescope workspaces<CR>')
utils.nnoremap('<LEADER>ft', '<CMD>Telescope tags<CR>')
utils.nnoremap('<LEADER>fm', '<CMD>Telescope marks<CR>')
utils.nnoremap('<LEADER>fo', '<CMD>Telescope oldfiles<CR>')
utils.nnoremap('<LEADER>fk', '<CMD>Telescope keymaps<CR>')
