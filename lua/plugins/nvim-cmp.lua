-- nvim-cmp
vim.o.completeopt = "menu,menuone,noselect"

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local neogen = require('neogen')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
    }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif neogen.jumpable() then
        require('neogen').jump_next()
      elseif vim.fn["vsnip#available"]() == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif neogen.jumpable(true) then
        require('neogen').jump_prev()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources(
    { {name = "vsnip", max_item_count = 5}, },
    { {name = "nvim_lsp", max_item_count = 5}, },
    { {name = "nvim_lua", max_item_count = 5}, },
    { {name = "buffer"}, },
    { {name = "path"}, },
    { {name = "emoji"}, },
    { {name = "latex_symbols"}, },
    { {name = 'copilot'}, },
    { {name = "cmp_tabnine", max_item_count = 5}, },
    { {name = "dictionary", keyword_length = 2, max_item_count = 5}, }
  ),
  formatting = {
    format = require("lspkind").cmp_format({with_text = true, menu = ({
      vsnip = "[Vsnip]",
      nvim_lsp = "[LSP]",
      nvim_lua = "[Lua]",
      buffer = "[Buffer]",
      path = "[Path]",
      emoji = "[Emoji]",
      latex_symbols = "[LaTeX]",
      copilot = "[Copilot]",
      cmp_tabnine = "[TabNine]",
      dictionary = "[Dictionary]",
    })}),
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})
