local function create_augroups(groups)
  for group, cmds in pairs(groups) do
    vim.cmd('augroup ' .. group)
    vim.cmd('autocmd!')
    for _, cmd in ipairs(cmds) do
      local cmd_content = table.concat(vim.tbl_flatten{'autocmd', cmd}, ' ')
      vim.cmd(cmd_content)
    end
    vim.cmd('augroup END')
  end
end

local function load_autocmds()
  local autocmds = {
    AutoLastLine = {
        { [[ BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") &&
        &ft !~# 'commit' |   exe "normal! g`\"" | endif ]] };
    };
    AutoTrailWhitespace = {
        { [[ BufWritePre * %s/\s\+$//e ]] };
        { [[ BufWritePre * %s/\n\+\%$//e ]] };
    };
    AutoRelativeLineNums = {
        { [[ InsertEnter * set norelativenumber ]] };
        { [[ InsertLeave * set relativenumber ]] };
    };
    AutoHighlight = {
        { [[ CursorHold * silent call CocActionAsync('highlight') ]] };
    };
    AutoLimelight = {
        { [[ User GoyoEnter Limelight ]] };
        { [[ User GoyoEnter Limelight! ]] };
    };
  }

  create_augroups(autocmds)
end

load_autocmds();
