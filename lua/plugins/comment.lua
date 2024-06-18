require('Comment').setup({
  toggler = {
      ---Line-comment toggle keymap
      line = nil,
      ---Block-comment toggle keymap
      block = 'gcc',
  },
  ---LHS of operator-pending mappings in NORMAL and VISUAL mode
  opleader = {
      ---Line-comment keymap
      line = nil,
      ---Block-comment keymap
      block = 'gc',
  },
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})
