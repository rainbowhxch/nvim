local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    -- refactor
    null_ls.builtins.code_actions.refactoring.with({
        filetypes = { "c", "cpp" },
    }),
    -- formator
    null_ls.builtins.formatting.clang_format.with({
        filetypes = { "c", "cpp" },
        extra_args = { "--style=Google" }
    }),
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.autopep8
  },
  on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
          vim.cmd([[
          augroup LspFormatting
              autocmd! * <buffer>
              autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
          augroup END
          ]])
      end
  end,
})
