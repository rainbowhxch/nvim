-- nvim-dap
local dap = require('dap')
dap.adapters.cpp = {
  type = 'executable',
  attach = {
    pidProperty = 'pid',
    pidSelect = 'ask'
  },
  command = 'lldb-vscode',
  env = {
    LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = 'YES'
  },
  name = 'lldb'
}
dap.configurations.cpp = {
  {
    type = 'cpp';
    request = 'launch';
    name = 'Launch file';
    program = vim.fn.expand('%:p:r');
    cwd = vim.fn.getcwd();
  },
  {
    type = 'cpp';
    request = 'attach';
    name = "Attach File";
    program = vim.fn.expand('%:p:r');
    cwd = vim.fn.getcwd();
  }
}
dap.defaults.fallback.external_terminal = {
  command = '/usr/local/bin/st';
  args = {'-e'};
}
vim.fn.sign_define('DapBreakpoint', {text='', texthl='DapBreakpointHL', linehl='DapBreakpointHL', numhl='DapBreakpointHL'})
vim.fn.sign_define('DapLogPoint', {text='', texthl='DapLogPointHL', linehl='DapLogPointHL', numhl='DapLogPointHL'})
vim.fn.sign_define('DapStopped', {text='', texthl='DapStoppedHL', linehl='DapStoppedHL', numhl='DapStoppedHL'})
vim.api.nvim_command('au FileType dap-repl lua require(\'dap.ext.autocompl\').attach()')
local utils = require('utils')
utils.nnoremap('<F2>', '<CMD>lua require\'dap\'.repl.toggle()<CR>')
utils.nnoremap('<F3>', '<CMD>lua require\'dap\'.run_last()<CR>')
utils.nnoremap('<F5>', '<CMD>lua require\'dap\'.continue()<CR>')
utils.nnoremap('<F8>', '<CMD>lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>')
utils.nnoremap('<LEADER><F8>', '<CMD>lua require\'dap\'.set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<CR>')
utils.nnoremap('<F9>', '<CMD>lua require\'dap\'.toggle_breakpoint()<CR>')
utils.nnoremap('<F10>', '<CMD>lua require\'dap\'.step_over()<CR>')
utils.nnoremap('<F11>', '<CMD>lua require\'dap\'.step_into()<CR>')
utils.nnoremap('<F12>', '<CMD>lua require\'dap\'.step_out()<CR>')
