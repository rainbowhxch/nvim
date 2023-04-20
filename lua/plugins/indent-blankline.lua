-- indentLine
require("indent_blankline").setup {
  use_treesitter = true,
  show_current_context = true,
  buftype_exclude = {'terminal'},
  filetype_exclude = {'help', 'startify', 'dashboard', 'packer', 'neogitstatus', 'alpha'},
  char = '▏',
  context_char = '┃',
  context_patterns = {
    'class', 'return', 'function', 'method', '^if', '^while', 'jsx_element', '^for', '^object', '^table', 'block',
    'arguments', 'if_statement', 'else_clause', 'jsx_element', 'jsx_self_closing_element', 'try_statement',
    'catch_clause', 'import_statement', 'operation_type'
  },
}
