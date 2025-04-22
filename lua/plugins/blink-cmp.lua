local neogen = require('neogen')
require("blink.cmp").setup({
  keymap = {
    preset = 'none',
    ['<C-space>'] = {},
    ['<C-e>'] = {},
    ['<CR>'] = { 'accept', 'fallback' },
    ['<Tab>'] = {
      'select_next',
      function()
        if neogen.jumpable() then
          require('neogen').jump_next()
        end
      end,
      'snippet_forward',
      'fallback',
    },
    ['<S-Tab>'] = {
      'select_prev',
      function()
        if neogen.jumpable(-1) then
          require('neogen').jump_prev()
        end
      end,
      'snippet_backward',
      'fallback',
    },
    ['<Up>'] = {},
    ['<Down>'] = {},
    ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
    ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    ['<C-k>'] = {},
  },
  signature = {
    enabled = true,
  },
  cmdline = {
    completion = {
      menu = { auto_show = true },
    },
  },
  completion = {
    keyword = {
      range = 'prefix',
    },
    menu = {
      draw = {
        treesitter = { 'lsp' },
        columns = {
          { "label", "label_description", gap = 1 },
          { "kind_icon", "kind" },
        },
      }
    },
    documentation = {
      auto_show = true,
    },
    ghost_text = { enabled = true },
  },
  sources = {
    default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 99,
      },
    },
  },
})
