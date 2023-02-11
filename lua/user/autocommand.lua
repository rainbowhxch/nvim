local function create_augroups(groups)
  for group, cmds in pairs(groups) do
    vim.api.nvim_create_augroup(group, { clear = true })
    for _, cmd in ipairs(cmds) do
      vim.api.nvim_create_autocmd(cmd.event, {
        pattern = cmd.pattern,
        callback = cmd.callback,
        nested = cmd.nested,
        group = group
      })
    end
  end
end

local function load_autocmds()
  local autocmds = {
    AutoLastLine = {
      {
        event = { "BufReadPost" },
        pattern = "*",
        callback = function()
          vim.cmd [[if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' |   exe "normal! g`\"" | endif]]
        end
      }
    };
    AutoTrailWhitespace = {
      {
        event = { "BufWritePre" },
        pattern = "*",
        callback = function()
          vim.cmd [[%s/\s\+$//e]]
        end
      },
      {
        event = { "BufWritePre" },
        pattern = "*",
        callback = function()
          vim.cmd [[%s/\n\+\%$//e]]
        end
      }
    };
    AutoRelativeLineNums = {
      {
        event = { "BufEnter", "FocusGained", "InsertLeave", "WinEnter" },
        pattern = "*",
        callback = function()
          vim.cmd [[if &nu && mode() != "i" | set relativenumber | endif]]
        end
      },
      {
        event = { "BufLeave", "FocusLost", "InsertEnter", "WinLeave" },
        pattern = "*",
        callback = function()
          vim.cmd [[if &nu                  | set nornu          | endif]]
        end
      }
    };
    AutoTextYank = {
      {
        event = { "TextYankPost" },
        pattern = "*",
        callback = function()
          vim.highlight.on_yank{ timeout=100 }
        end
      }
    };
    AutoCursorLine = {
      {
        event = { "WinEnter", "BufEnter" },
        pattern = "*",
        callback = function()
          vim.cmd [[setlocal cursorline]]
        end
      },
      {
        event = { "WinLeave", "BufLeave" },
        pattern = "*",
        callback = function()
          vim.cmd [[setlocal nocursorline]]
        end
      }
    };
    AutoNvimTreeClose = {
      {
        event = { "BufEnter" },
        pattern = "*",
        nested = true,
        callback = function()
          vim.cmd [[if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]
        end
      }
    }
  }

  create_augroups(autocmds)
end

load_autocmds();
