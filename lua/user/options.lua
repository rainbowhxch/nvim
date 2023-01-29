local cache_dir = vim.env.HOME .. '/.cache/nvim/'

local function createdir()
  local data_dir = {
    cache_dir..'vimtex',
  }
  if vim.fn.isdirectory(cache_dir) == 0 then
    os.execute("mkdir -p " .. cache_dir)
    for _,v in pairs(data_dir) do
      if vim.fn.isdirectory(v) == 0 then
        os.execute("mkdir -p " .. v)
      end
    end
  end
end

local function bind_option(options)
  for k, v in pairs(options) do
    if v == true or v == nil then
      vim.o[k] = true;
    elseif v == false then
      vim.o[k] = false
    else
      vim.o[k] = v;
    end
  end
end

local function load_options()
  local options = {
    encoding       = "utf-8";
    title          = true;
    autoread       = true;
    autowrite      = true;
    number         = true;
    relativenumber = true;
    cursorline     = true;
    colorcolumn    = '80';
    wrap           = true;
    showcmd        = true;
    ruler          = true;
    wildmenu       = true;
    history        = 100;
    timeout        = false;
    ttimeout       = false;
    hlsearch       = true;
    incsearch      = true;
    ignorecase     = true;
    smartcase      = true;
    whichwrap      = "b,s";
    shiftwidth     = 2;
    tabstop        = 2;
    softtabstop    = 2;
    expandtab      = true;
    shiftround      = true;
    list           = true;
    listchars      = "tab:▸ ,trail:▫";
    conceallevel   = 2;
    concealcursor  = "nc";
    scrolloff      = 6;
    autoindent     = true;
    smartindent    = true;
    backspace      = "indent,eol,start";
    sessionoptions = "blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal";
    foldmethod     = "indent";
    -- foldcolumn     = '1',
    fillchars      = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],
    foldlevelstart = -1,
    foldlevel      = 99;
    foldenable     = true,
    mouse          = "a";
    laststatus     = 3;
    cmdheight      = 0;
    autochdir      = true;
    lazyredraw     = false;
    termguicolors  = true;
    inccommand     = "split";
    showmode       = false;
    tags           = "./.tags;,.tags";
    guifont        = "JetBrainsMono Nerd Font";
    backup         = true;
    backupext      = ".bak";
    undofile       = true;
    shada          = "!,'100,<50,s10,h";
    directory      = cache_dir .. "swap//";
    undodir        = cache_dir .. "undo//";
    backupdir      = cache_dir .. "backup//";
    viewdir        = cache_dir .. "view//";
  }

  createdir();
  bind_option(options);
end

local function disable_buildin_plugins()
  local disabled_built_ins = {
      "netrw",
      "netrwPlugin",
      "netrwSettings",
      "netrwFileHandlers",
      "gzip",
      "zip",
      "zipPlugin",
      "tar",
      "tarPlugin",
      "getscript",
      "getscriptPlugin",
      "vimball",
      "vimballPlugin",
      "2html_plugin",
      "logipat",
      "rrhelper",
      "spellfile_plugin",
      "matchit"
  }

  for _, plugin in pairs(disabled_built_ins) do
      vim.g["loaded_" .. plugin] = 1
  end
end

local function statuscolumn()
  local status = {}
  _G.Status = status

  ---@return {name:string, text:string, texthl:string}[]
  function status.get_signs()
    local buf = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
    return vim.tbl_map(function(sign)
      return vim.fn.sign_getdefined(sign.name)[1]
    end, vim.fn.sign_getplaced(buf, { group = "*", lnum = vim.v.lnum })[1].signs)
  end

  function status.column()
    local sign, git_sign
    for _, s in ipairs(status.get_signs()) do
      if s.name:find("GitSign") then
        git_sign = s
      else
        sign = s
      end
    end

    local nu = " "
    local number = vim.api.nvim_win_get_option(vim.g.statusline_winid, "number")
    if number and vim.wo.relativenumber and vim.v.virtnum == 0 then
      nu = vim.v.relnum == 0 and vim.v.lnum or vim.v.relnum
    end
    local components = {
      sign and ("%#" .. sign.texthl .. "#" .. sign.text .. "%*") or " ",
      [[%=]],
      nu .. " ",
      git_sign and ("%#" .. git_sign.texthl .. "#" .. git_sign.text .. "%*") or "  ",
    }
    return table.concat(components, "")
  end

  vim.opt.statuscolumn = [[%!v:lua.Status.column()]]
end

load_options()
statuscolumn()
disable_buildin_plugins()
