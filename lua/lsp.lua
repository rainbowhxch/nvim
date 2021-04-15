local utils = require('utils')
local lspconfig = require('lspconfig')

local function common_on_attach(client, bufnr)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

  vim.fn.sign_define("LspDiagnosticsSignError",
                     {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"})
  vim.fn.sign_define("LspDiagnosticsSignWarning",
                     {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"})
  vim.fn.sign_define("LspDiagnosticsSignHint",
                     {texthl = "LspDiagnosticsSignHint", text = "ﯦ", numhl = "LspDiagnosticsSignHint"})
  vim.fn.sign_define("LspDiagnosticsSignInformation",
                     {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"})

  vim.api.nvim_command('set omnifunc=v:lua.vim.lsp.omnifunc')
  utils.nnoremap('[d', '<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>')
  utils.nnoremap(']d', '<CMD>lua vim.lsp.diagnostic.goto_next()<CR>')
  utils.nnoremap('gt', '<CMD>lua vim.lsp.buf.type_definition()<CR>')
  utils.nnoremap('gD', '<CMD>lua vim.lsp.buf.declaration()<CR>')
  utils.nnoremap('gd', '<CMD>lua vim.lsp.buf.definition()<CR>')
  utils.nnoremap('gr', '<CMD>lua vim.lsp.buf.rename()<CR>')
  utils.nnoremap('gR', '<CMD>lua vim.lsp.buf.references()<CR>')
  utils.nnoremap('gi', '<CMD>lua vim.lsp.buf.implementation()<CR>')
  utils.nnoremap('ga', '<CMD>lua vim.lsp.buf.code_action()<CR>')
  utils.nnoremap('g;', '<CMD>lua vim.lsp.buf.hover()<CR>')
  utils.nnoremap('gI', '<CMD>lua vim.lsp.buf.signature_help()<CR>')
end

-- c/cpp
lspconfig.clangd.setup{
  on_attach = common_on_attach;
}

-- python
lspconfig.jedi_language_server.setup{
  on_attach = common_on_attach;
}

-- bash
lspconfig.bashls.setup{
  on_attach = common_on_attach;
}


-- lua
local sumneko_root_path = '/use/share/lua-language-server'
local sumneko_binary = 'lua-language-server'
lspconfig.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  on_attach = common_on_attach;
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
lspconfig.texlab.setup{
  on_attach = common_on_attach;
}

-- vim
lspconfig.vimls.setup{
  on_attach = common_on_attach;
}

-- html
lspconfig.html.setup {
  on_attach = common_on_attach;
}

-- css
lspconfig.cssls.setup{
  on_attach = common_on_attach;
}

-- tsserver
lspconfig.tsserver.setup{
  on_attach = common_on_attach;
}

-- json
lspconfig.jsonls.setup{
  on_attach = common_on_attach;
}

-- yaml
lspconfig.yamlls.setup{
  on_attach = common_on_attach;
}

-- xml
require'lspconfig/configs'.xmlls = {
  default_config = {
    cmd = {'xml-language-server'};
    filetypes = {'xml'};
    root_dir = function(fname)
      return require'lspconfig'.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end;
    settings = {};
  };
}
lspconfig.xmlls.setup{
  on_attach = common_on_attach;
}

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
    Snippet = '  ',
    Color = ' ',
    File = '  ',
    Folder = ' ﱮ ',
    EnumMember = '  ',
    Constant = '  ',
    Struct = '   '
  },
})
