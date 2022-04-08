local utils = require('utils')
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.offsetEncoding = { "utf-16" }

local function common_on_attach(client, bufnr)
  if (client.name == 'clangd') then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
  vim.fn.sign_define("DiagnosticsSignError",
                     {texthl = "DiagnosticsSignError", text = "", numhl = "DiagnosticsSignError"})
  vim.fn.sign_define("DiagnosticsSignWarning",
                     {texthl = "DiagnosticsSignWarning", text = "", numhl = "DiagnosticsSignWarning"})
  vim.fn.sign_define("DiagnosticsSignHint",
                     {texthl = "DiagnosticsSignHint", text = "", numhl = "DiagnosticsSignHint"})
  vim.fn.sign_define("DiagnosticsSignInformation",
                     {texthl = "DiagnosticsSignInformation", text = "", numhl = "DiagnosticsSignInformation"})

  vim.api.nvim_command('set omnifunc=v:lua.vim.lsp.omnifunc')
  utils.nnoremap('[d', '<CMD>lua vim.diagnostic.goto_prev()<CR>')
  utils.nnoremap(']d', '<CMD>lua vim.diagnostic.goto_next()<CR>')
  utils.nnoremap('gt', '<CMD>lua vim.lsp.buf.type_definition()<CR>')
  utils.nnoremap('gT', '<CMD>Telescope lsp_workspace_symbols<CR>')
  utils.nnoremap('gD', '<CMD>lua vim.lsp.buf.declaration()<CR>')
  utils.nnoremap('gd', '<CMD>lua vim.lsp.buf.definition()<CR>')
  utils.nnoremap('gr', '<CMD>lua vim.lsp.buf.rename()<CR>')
  utils.nnoremap('gR', '<CMD>TroubleToggle lsp_references<CR>')
  utils.nnoremap('gi', '<CMD>lua vim.lsp.buf.implementation()<CR>')
  utils.nnoremap('ga', '<CMD>Telescope lsp_code_actions<CR>')
  utils.vnoremap('ga', ':Telescope lsp_range_code_actions<CR>')
  utils.nnoremap('g;', '<CMD>lua vim.lsp.buf.hover()<CR>')
  utils.nnoremap('gI', '<CMD>lua vim.lsp.buf.signature_help()<CR>')
  utils.nnoremap('gh', '<CMD>ClangdSwitchSourceHeader<CR>')
  utils.nnoremap('<LeftMouse>', '<LeftMouse><CMD>lua vim.lsp.buf.hover()<CR>')
  utils.nnoremap('<RightMouse>', '<LeftMouse><CMD>lua vim.lsp.buf.definition()<CR>')
  utils.nnoremap('<MiddleMouse>', '<C-o>')

  require'lsp_signature'.on_attach()
  require 'illuminate'.on_attach(client)
  require("aerial").on_attach(client, bufnr)
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

lspconfig.asm_lsp.setup{
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
  runtime_path = false,
  lspconfig = {
    cmd = {"lua-language-server"};
    capabilities = capabilities;
    on_attach = common_on_attach;
  },
})
lspconfig.sumneko_lua.setup(luadev)

-- golang
lspconfig.gopls.setup{
  capabilities = capabilities;
  on_attach = common_on_attach;
}

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

-- cmake
lspconfig.cmake.setup{
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

local config = {
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})
