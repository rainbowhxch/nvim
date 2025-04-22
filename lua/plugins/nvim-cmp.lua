-- nvim-cmp
local cmp = require('cmp')
cmp.setup({
  sources = cmp.config.sources(
    {
      {name = "Lingma", max_item_count = 5},
    }
  ),
})
