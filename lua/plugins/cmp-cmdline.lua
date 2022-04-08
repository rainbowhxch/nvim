local cmp = require('cmp')
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})
cmp.setup.cmdline(':', {
  sources = {
    { name = 'cmdline' }
  }
})
