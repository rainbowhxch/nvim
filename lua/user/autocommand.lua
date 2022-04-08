local function create_augroups(groups)
  for group, cmds in pairs(groups) do
    vim.api.nvim_command('augroup ' .. group)
    vim.api.nvim_command('autocmd!')
    for _, cmd in ipairs(cmds) do
      local cmd_content = table.concat(vim.tbl_flatten{'autocmd', cmd}, ' ')
      vim.api.nvim_command(cmd_content)
    end
    vim.api.nvim_command('augroup END')
  end
end

local function load_autocmds()
  local autocmds = {
    AutoLastLine = {
      { [[ BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' |   exe "normal! g`\"" | endif ]] };
    };
    AutoTrailWhitespace = {
      { [[ BufWritePre * %s/\s\+$//e ]] };
      { [[ BufWritePre * %s/\n\+\%$//e ]] };
    };
    AutoRelativeLineNums = {
      { [[ BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set relativenumber | endif ]] };
      { [[ BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu          | endif ]] };
    };
    AutoTextYank = {
      { [[ TextYankPost * silent! lua vim.highlight.on_yank{ timeout=100 } ]] };
    };
    AutoCursorLine = {
      { [[ WinEnter,BufEnter * setlocal cursorline ]] };
      { [[ WinLeave,BufLeave * setlocal nocursorline ]] };
    };
    AutoPackerInstall = {
      { [[ BufWritePost packer.lua source <afile> | PackerCompile ]] };
    };
    AutoNvimTreeClose = {
      { [[ BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif ]] }
    }
  }

  create_augroups(autocmds)
end

load_autocmds();
