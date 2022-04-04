-- nvim-workbench
local utils = require('utils')
vim.g.workbench_storage_path = os.getenv("HOME") .. "/Documents/Notes/"
utils.nmap('<LEADER>bp', '<Plug>ToggleProjectWorkbench')
utils.nmap('<LEADER>bb', '<Plug>ToggleBranchWorkbench')
