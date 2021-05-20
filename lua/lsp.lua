local utils = require('utils')
local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local function common_on_attach(client, bufnr)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
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
  utils.nnoremap('gT', '<CMD>lua vim.lsp.buf.workspace_symbol()<CR>')
  utils.nnoremap('gD', '<CMD>lua vim.lsp.buf.declaration()<CR>')
  utils.nnoremap('gd', '<CMD>lua vim.lsp.buf.definition()<CR>')
  utils.nnoremap('gr', '<CMD>lua vim.lsp.buf.rename()<CR>')
  utils.nnoremap('gR', '<CMD>lua vim.lsp.buf.references()<CR>')
  utils.nnoremap('gi', '<CMD>lua vim.lsp.buf.implementation()<CR>')
  utils.nnoremap('ga', '<CMD>lua vim.lsp.buf.code_action()<CR>')
  utils.nnoremap('g;', '<CMD>lua vim.lsp.buf.hover()<CR>')
  utils.nnoremap('gI', '<CMD>lua vim.lsp.buf.signature_help()<CR>')
  utils.nnoremap('gh', '<CMD>ClangdSwitchSourceHeader<CR>')

  require'lsp_signature'.on_attach()
  require 'illuminate'.on_attach(client)
end

-- c/cpp
lspconfig.clangd.setup{
  capabilities = capabilities;
  on_attach = common_on_attach;
}

-- python
lspconfig.jedi_language_server.setup{
  capabilities = capabilities;
  on_attach = common_on_attach;
}

-- bash
lspconfig.bashls.setup{
  capabilities = capabilities;
  on_attach = common_on_attach;
}


-- lua
local luadev = require("lua-dev").setup({
  library = {
    vimruntime = true, -- runtime path
    types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
    plugins = true, -- installed opt or start plugins in packpath
    -- you can also specify the list of plugins to make available as a workspace library
    -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
  },
  lspconfig = {
    cmd = {"lua-language-server"};
    capabilities = capabilities;
    on_attach = common_on_attach;
  },
})
lspconfig.sumneko_lua.setup(luadev)

-- tex
lspconfig.texlab.setup{
  capabilities = capabilities;
  on_attach = common_on_attach;
}

-- vim
lspconfig.vimls.setup{
  capabilities = capabilities;
  on_attach = common_on_attach;
}

-- html
lspconfig.html.setup {
  capabilities = capabilities;
  on_attach = common_on_attach;
}

-- css
lspconfig.cssls.setup{
  capabilities = capabilities;
  on_attach = common_on_attach;
}

-- tsserver
lspconfig.tsserver.setup{
  capabilities = capabilities;
  on_attach = common_on_attach;
}

-- json
lspconfig.jsonls.setup{
  capabilities = capabilities;
  on_attach = common_on_attach;
}

-- yaml
lspconfig.yamlls.setup{
  capabilities = capabilities;
  on_attach = common_on_attach;
}

-- xml
if not lspconfig.xmlls then
    require'lspconfig/configs'.xmlls = {
      default_config = {
        cmd = {'xml-language-server', '--stdio'};
        filetypes = {'xml'};
        root_dir = function(fname)
          return require'lspconfig'.util.find_git_ancestor(fname) or vim.loop.os_homedir()
        end;
        settings = {};
      };
    }
end
lspconfig.xmlls.setup{
  capabilities = capabilities;
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
