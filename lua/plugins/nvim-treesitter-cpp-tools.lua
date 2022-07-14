require'nvim-treesitter.configs'.setup {
  nt_cpp_tools = {
        enable = true,
        preview = {
            quit = '<ESC>', -- optional keymapping for quit preview
            accept = '<C-space>' -- optional keymapping for accept preview
        },
  }
}
function _G.nt_cpp_tools_select()
  local items = { 'TSCppDefineClassFunc', 'TSCppMakeConcreteClass', 'TSCppRuleOf3', 'TSCppRuleOf5' }
  local opts = { prompt = 'TSCpp> ' }
  local function actions(choice)
    if choice == 'TSCppDefineClassFunc' then
      vim.api.nvim_command('\'<,\'>TSCppDefineClassFunc')
    elseif choice == 'TSCppMakeConcreteClass' then
      vim.api.nvim_command('\'<,\'>TSCppMakeConcreteClass')
    elseif choice == 'TSCppRuleOf3' then
      vim.api.nvim_command('\'<,\'>TSCppRuleOf3')
    elseif choice == 'TSCppRuleOf5' then
      vim.api.nvim_command('\'<,\'>TSCppRuleOf5')
    end
  end
  vim.ui.select(items, opts, actions)
end
local utils = require'utils'
utils.vnoremap('<leader>cg', _G.nt_cpp_tools_select)
