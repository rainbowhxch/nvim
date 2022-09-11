local cache_dir = os.getenv("HOME") .. '/.cache/nvim/'

local function createdir()
  local data_dir = {
    cache_dir..'vimtex',
  }
  -- There only check once that If cache_dir exists
  -- Then i don't want to check subs dir exists
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
    autochdir      = true;
    lazyredraw     = true;
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

vim.api.nvim_command('filetype plugin indent on')
vim.api.nvim_command('syntax enable')
vim.g.do_filetype_lua = true
vim.g.did_load_filetypes = false
load_options();
disable_buildin_plugins();
