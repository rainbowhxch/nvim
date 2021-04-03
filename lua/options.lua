local cache_dir = os.getenv("HOME") .. '/.cache/nvim/'

local function createdir()
  local data_dir = {
    cache_dir..'backup',
    cache_dir..'undo',
    cache_dir..'swap',
    cache_dir..'view',
    cache_dir..'undo',
    cache_dir..'vimtex',
    cache_dir..'vista',
  }
  -- There only check once that If cache_dir exists
  -- Then I don't want to check subs dir exists
  if vim.fn.isdirectory(cache_dir) == 0 then
    os.execute("mkdir -p " .. cache_dir)
    for _,v in pairs(data_dir) do
      if vim.fn.isdirectory(v) == 0 then
        os.execute("mkdir -p " .. v)
      end
    end
  end
end

createdir();

local function bind_option(options)
    for k, v in pairs(options) do
        if v == true or v == nil then
            vim.cmd(string.format('set %s', k))
        elseif v == false then
            vim.cmd(string.format('set no%s', k))
        else
            vim.cmd(string.format('set %s=%s', k, v))
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
        colorcolumn    = 80;
        wrap           = true;
        showcmd        = true;
        ruler          = true;
        wildmenu       = true;
        history        = 100;
        timeout        = true;
        timeoutlen     = 1500;
        ttimeout       = false;
        hlsearch       = true;
        incsearch      = true;
        ignorecase     = true;
        smartcase      = true;
        whichwrap      = "b,s";
        shiftwidth     = 4;
        tabstop        = 4;
        softtabstop    = 4;
        expandtab      = true;
        list           = true;
        listchars      = "tab:▸\\ ,trail:▫";
        conceallevel   = 2;
        concealcursor  = "nc";
        scrolloff      = 16;
        autoindent     = true;
        smartindent    = true;
        backspace      = "indent,eol,start";
        foldmethod     = "indent";
        foldlevel      = 99;
        laststatus     = 2;
        updatetime     = 100;
        updatecount    = 100;
        autochdir      = true;
        lazyredraw     = true;
        termguicolors  = true;
        inccommand     = "split";
        showmode   = false;
        tags           = "./.tags;,.tags";
        backup         = true;
        backupext      = ".bak";
        undofile       = true;
        shada          = "!,'100,<50,s10,h";
        directory      = cache_dir .. "swag/";
        undodir        = cache_dir .. "undo/";
        backupdir      = cache_dir .. "backup/";
        viewdir        = cache_dir .. "view/";
        shadafile      = cache_dir .. "shada";
    }

    bind_option(options);
end

vim.api.nvim_command('filetype plugin indent on')
vim.api.nvim_command('syntax enable')
load_options();
