-- nvim-dap
local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = 'lldb-vscode',
  name = 'lldb'
}
dap.configurations.cpp = {
  {
    name = 'Launch';
    type = 'lldb';
    request = 'launch';
    program = vim.fn.expand('%:p:r');
    cwd = vim.fn.getcwd();
  },
  {
    type = 'lldb';
    request = 'attach';
    name = "Attach";
    program = vim.fn.expand('%:p:r');
    cwd = vim.fn.getcwd();
  }
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
local utils = require('utils')
utils.nnoremap('<LEADER>dc', require('dap').continue)
utils.nnoremap('<LEADER>db', require('dap').toggle_breakpoint)
utils.nnoremap('<LEADER>dn', require('dap').step_over)
utils.nnoremap('<LEADER>di', require('dap').step_into)
utils.nnoremap('<LEADER>do', require('dap').step_out)
utils.nnoremap('<LEADER>dd', require('dap').stop)
