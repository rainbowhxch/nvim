-- nvim-workbench
local utils = require('utils')
vim.g.workbench_storage_path = vim.env.HOME .. "/Documents/Notes/"
utils.nmap('<LEADER>bp', '<Plug>ToggleProjectWorkbench')
utils.nmap('<LEADER>bb', '<Plug>ToggleBranchWorkbench')
