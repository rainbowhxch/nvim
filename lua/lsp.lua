local utils = require('utils')
local lspconfig = require('lspconfig')

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
  utils.nnoremap('gt', vim.lsp.buf.type_definition)
  utils.nnoremap('gT', '<CMD>Telescope lsp_workspace_symbols<CR>')
  utils.nnoremap('gm', '<CMD>Telescope lsp_document_symbols<CR>')
  utils.nnoremap('gD', vim.lsp.buf.declaration)
  utils.nnoremap('gd', '<CMD>Telescope lsp_definitions<CR>')
  utils.nnoremap_with_expr('gr', function() return ":IncRename " .. vim.fn.expand("<cword>") end)
  utils.nnoremap('gR', '<CMD>Trouble lsp_references<CR>')
  utils.nnoremap('gi', vim.lsp.buf.implementation)
  utils.nnoremap('ga', '<CMD>Telescope lsp_code_actions<CR>')
  utils.vnoremap('ga', '<CMD>Telescope lsp_range_code_actions<CR>')
  utils.nnoremap('g;', vim.lsp.buf.hover)
  utils.nnoremap('gI', vim.lsp.buf.signature_help)
  utils.nnoremap('gF', function() require("conform").format({ bufnr = bufnr, timeout_ms = 3000, lsp_format = "fallback" }) end)
  utils.nnoremap('gh', '<CMD>ClangdSwitchSourceHeader<CR>')

  require "lsp_signature".on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded"
    },
    select_signature_key = '<C-\'>',
  }, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
end

-- c/cpp
lspconfig.clangd.setup{
  on_attach = common_on_attach;
  settings = {
    clangd = {
      InlayHints = {
        Designators = true,
        Enabled = true,
        ParameterNames = true,
        DeducedTypes = true,
      },
      fallbackFlags = { "-std=c++20" },
    },
  },
}

-- rust
require("rust-tools").setup{
  server = {
    on_attach = common_on_attach;
  }
}

-- python
lspconfig.jedi_language_server.setup{
  on_attach = common_on_attach;
}
lspconfig.ruff.setup{
  on_attach = common_on_attach;
}

-- bash
lspconfig.bashls.setup{
  on_attach = common_on_attach;
}

-- asm
lspconfig.asm_lsp.setup{
  on_attach = common_on_attach;
}

-- lua
lspconfig.lua_ls.setup{
  on_attach = common_on_attach;
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      },
      hint = {
        enable = true
      },
    },
  },
}

-- golang
require('go').setup({
  lsp_cfg = {
    on_attach = common_on_attach;
    settings = {
      gopls = {
        hints = {
          rangeVariableTypes = false,
          parameterNames = false,
          constantValues = false,
          assignVariableTypes = false,
          functionTypeParameters = false,
        },
      }
    }
  },
})

-- markdown
lspconfig.marksman.setup{
  on_attach = common_on_attach;
}

-- tex
lspconfig.texlab.setup{
  on_attach = common_on_attach;
}

-- vim
lspconfig.vimls.setup{
  on_attach = common_on_attach;
}

-- cmake
lspconfig.cmake.setup{
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
lspconfig.lemminx.setup{
  on_attach = common_on_attach;
}

local config = {
  virtual_text = false,
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
