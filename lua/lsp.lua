local utils = require('utils')
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local function dorename(win)
  local new_name = vim.trim(vim.fn.getline('.'))
  vim.api.nvim_win_close(win, true)
  vim.lsp.buf.rename(new_name)
end

local function rename()
  local opts = {
    relative = 'cursor',
    row = 0,
    col = 0,
    width = 30,
    height = 1,
    style = 'minimal',
    border = 'single'
  }
  local cword = vim.fn.expand('<cword>')
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, opts)
  local rename_fmt =  '<cmd>lua Rename.dorename(%d)<CR>'
  local close_fmt =  '<cmd>lua vim.api.nvim_win_close(%d)<CR>'

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {cword})
  vim.api.nvim_buf_set_keymap(buf, 'i', '<CR>', string.format(rename_fmt, win), {silent=true})
  vim.api.nvim_buf_set_keymap(buf, 'n', '<ESC>', string.format(close_fmt, win), {silent=true})
end

_G.Rename = {
   rename = rename,
   dorename = dorename
}

local function common_on_attach(client, bufnr)

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
  utils.nnoremap('gr', '<CMD>lua Rename.rename()<CR>')
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
lspconfig.lemminx.setup{
  cmd = { "/usr/bin/lemminx" };
  capabilities = capabilities;
  on_attach = common_on_attach;
}

-- emf
lspconfig.efm.setup{
  filetypes = { 'python', 'lua' };
  init_options = {documentFormatting = true},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      lua = {
        {formatCommand = "lua-format -i", formatStdin = true}
      }
    }
  }
}
