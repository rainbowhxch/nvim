local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    -- refactor
    null_ls.builtins.code_actions.refactoring.with({
        filetypes = { "c", "cpp", "go", "python" },
    }),
    -- formator
    null_ls.builtins.formatting.clang_format.with({
        filetypes = { "c", "cpp" },
    }),
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.diagnostics.golangci_lint,
    null_ls.builtins.code_actions.gomodifytags,
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.formatting.isort,
  },
  -- on_attach = function(client)
  --     if client.resolved_capabilities.document_formatting then
  --         vim.cmd([[
  --         augroup LspFormatting
  --             autocmd! * <buffer>
  --             autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
  --         augroup END
  --         ]])
  --     end
  -- end,
})
