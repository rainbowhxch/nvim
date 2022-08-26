require("nvim-lsp-installer").setup({
  install_root_dir = "~/.local/bin",
})
local utils = require('utils')
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.offsetEncoding = { "utf-16" }

local function common_on_attach(client, bufnr)
  vim.fn.sign_define("DiagnosticsSignError",
                     {texthl = "DiagnosticsSignError", text = "", numhl = "DiagnosticsSignError"})
  vim.fn.sign_define("DiagnosticsSignWarning",
                     {texthl = "DiagnosticsSignWarning", text = "", numhl = "DiagnosticsSignWarning"})
  vim.fn.sign_define("DiagnosticsSignHint",
                     {texthl = "DiagnosticsSignHint", text = "", numhl = "DiagnosticsSignHint"})
  vim.fn.sign_define("DiagnosticsSignInformation",
                     {texthl = "DiagnosticsSignInformation", text = "", numhl = "DiagnosticsSignInformation"})

  vim.api.nvim_command('set omnifunc=v:lua.vim.lsp.omnifunc')
  utils.nnoremap('[d', vim.diagnostic.goto_prev)
  utils.nnoremap(']d', vim.diagnostic.goto_next)
  utils.nnoremap('gt', vim.lsp.buf.type_definition)
  utils.nnoremap('gT', '<CMD>Telescope lsp_workspace_symbols<CR>')
  utils.nnoremap('gD', vim.lsp.buf.declaration)
  utils.nnoremap('gd', '<CMD>Telescope lsp_definitions<CR>')
  utils.nnoremap('gr', vim.lsp.buf.rename)
  utils.nnoremap('gR', '<CMD>TroubleToggle lsp_references<CR>')
  utils.nnoremap('gi', vim.lsp.buf.implementation)
  utils.nnoremap('ga', '<CMD>Telescope lsp_code_actions<CR>')
  utils.vnoremap('ga', ':Telescope lsp_range_code_actions<CR>')
  utils.nnoremap('g;', vim.lsp.buf.hover)
  utils.nnoremap('gI', vim.lsp.buf.signature_help)
  utils.nnoremap('gF', vim.lsp.buf.formatting_sync)
  utils.nnoremap('gh', '<CMD>ClangdSwitchSourceHeader<CR>')
  utils.nnoremap('<LeftMouse>', '<LeftMouse><CMD>lua vim.lsp.buf.hover()<CR>')
  utils.nnoremap('<RightMouse>', '<LeftMouse><CMD>lua vim.lsp.buf.definition()<CR>')
  utils.nnoremap('<MiddleMouse>', '<C-o>')

  require "lsp_signature".on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded"
    },
    select_signature_key = '<C-\'>',
  }, bufnr)
  require("nvim-navic").attach(client, bufnr)
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
