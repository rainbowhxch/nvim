-- c/cpp
require'lspconfig'.clangd.setup{}

-- python
require'lspconfig'.jedi_language_server.setup{}

-- bash
require'lspconfig'.bashls.setup{}

-- lua
local sumneko_root_path = '/use/share/lua-language-server'
local sumneko_binary = 'lua-language-server'
require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- tex
require'lspconfig'.texlab.setup{}

-- vim
require'lspconfig'.vimls.setup{}

-- html
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

-- css
require'lspconfig'.cssls.setup{}

-- tsserver
require'lspconfig'.tsserver.setup{}

-- json
require'lspconfig'.jsonls.setup{}

-- yaml
require'lspconfig'.yamlls.setup{}

-- lspkind-nvim
require('lspkind').init({
    with_text = false,
    symbol_map = {
      Text = '  ',
      Method = '  ',
      Function = '  ',
      Constructor = '  ',
      Variable = '[]',
      Class = '  ',
      Interface = ' 蘒',
      Module = '  ',
      Property = '  ',
      Unit = ' 塞 ',
      Value = '  ',
      Enum = ' 練',
      Keyword = '  ',
      Snippet = ' Ⓢ ',
      Color = ' ',
      File = '  ',
      Folder = ' ﱮ ',
      EnumMember = '  ',
      Constant = '  ',
      Struct = '   '
    },
})
