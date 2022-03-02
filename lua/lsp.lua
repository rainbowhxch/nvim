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
    border = 'rounded'
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
  if (client.name ~= 'clangd') then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
    vim.api.nvim_command [[augroup END]]
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
  utils.nnoremap('<LeftMouse>', '<LeftMouse><CMD>lua vim.lsp.buf.hover()<CR>')
  utils.nnoremap('<RightMouse>', '<LeftMouse><CMD>lua vim.lsp.buf.definition()<CR>')
  utils.nnoremap('<MiddleMouse>', '<C-o>')

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

-- emf
lspconfig.efm.setup{
  filetypes = { 'python', 'lua' };
  init_options = {documentFormatting = true},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      c = {
        {formatCommand = "clang-format --style=Google", formatStdin = true}
      };
      cpp = {
        {formatCommand = "clang-format --style=Google", formatStdin = true}
      };
      python = {
        {formatCommand = "autopep8", formatStdin = true}
      };
      json = {
        {formatCommand = "prettier", formatStdin = true}
      };
      markdown = {
        {formatCommand = "prettier", formatStdin = true}
      };
      yaml = {
        {formatCommand = "prettier", formatStdin = true}
      };
    }
  };
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_command [[augroup Format]]
      vim.api.nvim_command [[autocmd! * <buffer>]]
      vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
      vim.api.nvim_command [[augroup END]]
    end
  end
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
