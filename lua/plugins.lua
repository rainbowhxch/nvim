local fn = vim.fn
local utils = require('utils')
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local vsnip_path = fn.stdpath('config') .. '/snippets/'
local cache_dir = os.getenv("HOME") .. '/.cache/nvim/'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
  -- packer.nvim itself
  use { 'wbthomason/packer.nvim' }

  -- decoration
  use { 'windwp/nvim-autopairs' }
  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'glepnir/dashboard-nvim' }
  use { 'glepnir/galaxyline.nvim' }
  use { 'romgrk/barbar.nvim' }
  use { 'aklt/plantuml-syntax' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'p00f/nvim-ts-rainbow', requires = {'nvim-treesitter/nvim-treesitter'} }
  use { 'windwp/nvim-ts-autotag', requires = {'nvim-treesitter/nvim-treesitter'} }
  use { 'JoosepAlviste/nvim-ts-context-commentstring', requires = {'nvim-treesitter/nvim-treesitter'} }
  use { 'nvim-treesitter/nvim-treesitter-textobjects', requires = {'nvim-treesitter/nvim-treesitter'} }
  -- use { 'romgrk/nvim-treesitter-context', requires = {'nvim-treesitter/nvim-treesitter'} }
  use { 'norcalli/nvim-colorizer.lua' }
  use { 'wfxr/minimap.vim', cmd = {'MinimapToggle'} }
  use { 'karb94/neoscroll.nvim' }
  use { 'kevinhwang91/nvim-hlslens' }
  use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'} }
  -- use { 'danilamihailov/beacon.nvim' }

  -- reading mode
  use { 'folke/zen-mode.nvim' }
  use { 'junegunn/limelight.vim' }

  -- functional
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}} }
  use { 'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'} }
  use { 'iamcco/markdown-preview.nvim', ft = {'markdown'}, run = 'cd app && yarn install', cmd = 'MarkdownPreview' }
  use { 'mzlogin/vim-markdown-toc', ft = {'markdown'}, cmd = {'GenTocGFM'} }
  use { 'dhruvasagar/vim-table-mode', ft = {'markdown'} }
  use { 'lervag/vimtex', ft = {'tex'} }
  use { 'junegunn/vim-easy-align' }
  use { 'phaazon/hop.nvim' }
  use { 'MattesGroeger/vim-bookmarks' }
  use { 'lambdalisue/suda.vim' }
  use { 'voldikss/vim-floaterm' }
  use { 'tpope/vim-surround' }
  use { 'terrortylor/nvim-comment' }
  use { 'brooth/far.vim', cmd = {'Farp'} }
  use { 'drmikehenry/vim-headerguard', ft = {'c', 'cpp'}, cmd = {'HeaderguardAdd'} }
  use { 'mbbill/undotree', cmd = {'UndotreeToggle'} }
  use { 'rhysd/accelerated-jk' }
  use { 'metakirby5/codi.vim' }
  use { 'mfussenegger/nvim-dap' }
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use { 'theHamsta/nvim-dap-virtual-text' }
  use { 'kevinhwang91/nvim-bqf' }
  use { 'kkoomen/vim-doge', run = ':call doge#install()' }
  use { 'michaeljsmith/vim-indent-object' }
  use { 'alpertuna/vim-header' }
  use { 'windwp/nvim-spectre' }
  use { 'marcushwz/nvim-workbench' }
  use { 'dkarter/bullets.vim' }
  use { 'triglav/vim-visual-increment' }
  use { 'mg979/vim-visual-multi' }
  use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }
  use { 's1n7ax/nvim-comment-frame' }
  use { "chentau/marks.nvim" }
  use { "AckslD/nvim-neoclip.lua", requires = {'tami5/sqlite.lua', module = 'sqlite'} }
  use { "junegunn/vim-peekaboo" }
  use { "github/copilot.vim" }
  use { "hrsh7th/cmp-copilot" }
  use { "rcarriga/nvim-notify" }
  use { "numToStr/FTerm.nvim" }
  use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }
  use { 'liuchengxu/vista.vim' }
  use { 'ray-x/starry.nvim' }

  -- lsp
  use { 'neovim/nvim-lspconfig' }
  use { 'onsails/lspkind-nvim' }
  use { 'ray-x/lsp_signature.nvim' }
  use { 'RishabhRD/nvim-lsputils', requires = {{'RishabhRD/popfix'}} }
  use { 'RRethy/vim-illuminate' }
  use { "folke/lua-dev.nvim" }

  -- autocompletor
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/cmp-emoji" },
      { "tzachar/cmp-tabnine", run = "./install.sh" },
    }
  }
  use { 'hrsh7th/vim-vsnip' }
  use { "rafamadriz/friendly-snippets" }
  use { 'hrsh7th/vim-vsnip-integ' }

  -- themes
  use { 'monsonjeremy/onedark.nvim' }
  use { 'ajmwagar/vim-deus' }
  use { "lifepillar/vim-gruvbox8" }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- nvim-autopairs
require('nvim-autopairs').setup()

-- barbar.nvim
utils.nnoremap('sb', '<Cmd>BufferPick<CR>')
utils.nnoremap(']b', '<Cmd>BufferNext<CR>')
utils.nnoremap('[b', '<Cmd>BufferPrevious<CR>')
utils.nnoremap('H', '<Cmd>BufferClose<CR>')

-- nvim-colorizer.lua
require'colorizer'.setup()

-- nvim-treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
  rainbow = {
    enable = true,
  },
  autotag = {
    enable = true,
    filetypes = { "html" , "xml" },
  },
  context_commentstring = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["ip"] = "@parameter.inner",
        ["ap"] = "@parameter.outer",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      goto_next_start = {
        ["]p"] = "@parameter.inner",
        ["]f"] = "@function.outer",
        ["]c"] = "@class.outer",
      },
      goto_next_end = {
        ["]P"] = "@parameter.inner",
        ["]F"] = "@function.outer",
        ["]C"] = "@class.outer",
      },
      goto_previous_start = {
        ["[p"] = "@parameter.inner",
        ["[f"] = "@function.outer",
        ["[c"] = "@class.outer",
      },
      goto_previous_end = {
        ["[P"] = "@parameter.inner",
        ["[F"] = "@function.outer",
        ["[C"] = "@class.outer",
      },
    },
  },
  matchup = {
    enable = true;
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      scope_incremental = '<CR>',
      node_incremental = '<TAB>',
      node_decremental = '<S-TAB>',
    },
  },
}

-- vim-bookmarks
vim.g.bookmark_sign = ''
vim.g.bookmark_annotation_sign = '☰'
vim.g.bookmark_no_default_key_mappings = 1
utils.nmap('<LEADER>mt', '<Plug>BookmarkToggle')
utils.nmap('<LEADER>ma', '<Plug>BookmarkAnnotate')
utils.nmap('<LEADER>mm', '<Plug>BookmarkShowAll')
utils.nmap(']m', '<Plug>BookmarkNext')
utils.nmap('[m', '<Plug>BookmarkPrev')
utils.nmap('<LEADER>mc', '<Plug>BookmarkClear')
utils.nmap('<LEADER>mC', '<Plug>BookmarkClearAll')

-- nvim-commment
require('nvim_comment').setup({
  -- Linters prefer comment and line to have a space in between markers
  marker_padding = true,
  -- should comment out empty or whitespace only lines
  comment_empty = true,
  -- Should key mappings be created
  create_mappings = true,
  -- Normal mode mapping left hand side
  line_mapping = "gcc",
  -- Visual/Operator mapping left hand side
  operator_mapping = "<LEADER>cc"
})

-- galaxyline.nvim
require('eviline')

-- accelerated-jk
utils.nmap('j', '<Plug>(accelerated_jk_gj)')
utils.nmap('k', '<Plug>(accelerated_jk_gk)')

-- undotree.vim
utils.nnoremap('U', '<CMD>UndotreeToggle<CR>')
vim.cmd([[
    function! g:Undotree_CustomMap()
        nmap <buffer> J <plug>UndotreeNextState
        nmap <buffer> K <plug>UndotreePreviousState
    endfunc
]])

-- vim-headerguard.vim
utils.nnoremap('<LEADER>ah', '<CMD>HeaderguardAdd<CR>')

-- far.vim
utils.nnoremap('sp', '<CMD>Farp<CR>')
vim.g['far#default_mappings'] = 1
vim.g['far#enable_undo'] = 1
vim.g['far#mapping'] = {
	exclude = '';
	include = '';
	toggle_exclude = '';
	exclude_all = '';
	include_all = '';
	toggle_exclude_all = '';
	expand = '';
	collapse = '';
	toggle_expand = '';
	expand_all = '';
	collapse_all = '';
	toggle_expand_all = '';
	stoggle_exclude = 'e';
	stoggle_exclude_all = 'E';
	jump_to_source = '<CR>';
	open_preview = 'p';
	close_preview = 'P';
	preview_scroll_up = '<C-k>';
	preview_scroll_down = '<C-j>';
	stoggle_expand = 'za';
	stoggle_expand_all = 'zA';
	replace_do = 'r';
	replace_undo = 'u';
	replace_undo_all = 'U';
	quit = 'q';
}

-- vim-surround
utils.nmap('<LEADER>"', 'ysiW"')
utils.nmap('<LEADER>\'', 'ysiW\'')
utils.nmap('<LEADER>(', 'ysiW)')
utils.nmap('<LEADER>{', 'ysiW{')
utils.nmap('<LEADER>[', 'ysiW[')
utils.nmap('<LEADER>/', 'ysiW*ysiW/f*a<SPACE><ESC>f*i<SPACE><ESC>b')

-- VimTex
vim.g.vimtex_mappings_enabled = 0
vim.g.vimtex_cache_root = cache_dir .. 'vimtex'
vim.g.tex_flavor = 'latex'
vim.g.vimtex_toc_enabled = 0
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_view_method = 'zathura'

-- markdown-preview.vim
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_refresh_slow = 0
vim.g.mkdp_command_for_global = 0
vim.g.mkdp_open_to_the_world = 0
vim.g.mkdp_open_ip = ''
vim.g.mkdp_browser = ''
vim.g.mkdp_echo_preview_url = 0
vim.g.mkdp_browserfunc = ''
vim.g.mkdp_preview_options = {
  mkit = {};
  katex = {};
  uml = {};
  maid = {};
  disable_sync_scroll = 0;
  sync_scroll_type = 'middle';
  hide_yaml_meta = 1;
  sequence_diagrams = {};
  flowchart_diagrams = {}
}
vim.g.mkdp_markdown_css = ''
vim.g.mkdp_highlight_css = ''
vim.g.mkdp_port = ''
vim.g.mkdp_page_title = '「${name}」'

-- vim-markdown-toc
utils.nnoremap('<LEADER>tc', '<CMD>GenTocGFM<CR>')
vim.g.vmt_auto_update_on_save = 1
vim.g.vmt_dont_insert_fence = 0
vim.g.vmt_cycle_list_item_markers = 1
vim.g.vmt_include_headings_before = 0
vim.g.vmt_fence_text = 'TOC'
vim.g.vmt_fence_closing_text = '/TOC'

-- vim-table-mode
vim.g.table_mode_corner = '|'

-- vim-easy-align
utils.nmap('<LEADER>al', '<Plug>(EasyAlign)')
utils.xmap('<LEADER>al', '<Plug>(EasyAlign)')

-- hop.nvim
require'hop'.setup()
-- sf{char} to move to {char}
utils.nnoremap('sf', '<CMD>HopChar1<CR>')
utils.vnoremap('sf', '<CMD>HopChar1<CR>')
-- Move to line
utils.nnoremap('sL', '<CMD>HopLine<CR>')
utils.vnoremap('sL', '<CMD>HopLine<CR>')

-- suda.vim
vim.g['suda#prompt'] = '(. > .) password please: '
vim.g.suda_smart_edit = 1

utils.nnoremap('<F7>', '<CMD>lua require(\'utils\').file_run()<CR>')

-- gitsigns.nvim
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '▎', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '▎', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '契', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '契', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '▎', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  numhl = false,
  linehl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,

    ['n ]g'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
    ['n [g'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
  },
  watch_index = {
    interval = 1000
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
}

-- indentLine
vim.g.indent_blankline_buftype_exclude = {'terminal'}
vim.g.indent_blankline_filetype_exclude = {'help', 'startify', 'dashboard', 'packer', 'neogitstatus', ''}
vim.g.indent_blankline_char = '▏'
vim.g.indent_blankline_context_char = '┃'
-- vim.g.indent_blankline_char_list = {'|', '¦', '┆', '┊'}
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {
  'class', 'return', 'function', 'method', '^if', '^while', 'jsx_element', '^for', '^object', '^table', 'block',
  'arguments', 'if_statement', 'else_clause', 'jsx_element', 'jsx_self_closing_element', 'try_statement',
  'catch_clause', 'import_statement', 'operation_type'
}

-- nvim-telescope
local actions = require('telescope.actions')
require('telescope').load_extension('neoclip')
require('telescope').setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    -- set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default + actions.center
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<space>"] = actions.toggle_selection,
        ["<V>"] = actions.toggle_all,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      }
    }
  },
  extensions = {
    media_files = {
      filetypes = {"png", "webp", "jpg", "jpeg", "pdf"},
      find_cmd = "rg"
    }
  }
}
utils.nnoremap('<LEADER>ff', '<CMD>Telescope find_files<CR>')
utils.nnoremap('<LEADER>fg', '<CMD>Telescope git_files<CR>')
utils.nnoremap('<LEADER>fb', '<CMD>Telescope buffers<CR>')
utils.nnoremap('<LEADER>fc', '<CMD>Telescope colorscheme<CR>')
utils.nnoremap('<LEADER>fs', '<CMD>Telescope current_buffer_fuzzy_find<CR>')
utils.nnoremap('<LEADER>fS', '<CMD>Telescope grep_string<CR>')
utils.nnoremap('<LEADER>ft', '<CMD>Telescope tags<CR>')
utils.nnoremap('<LEADER>fm', '<CMD>Telescope marks<CR>')
utils.nnoremap('<LEADER>fo', '<CMD>Telescope oldfiles<CR>')
utils.nnoremap('<LEADER>fM', '<CMD>Telescope keymaps<CR>')
utils.nnoremap('<LEADER>fp', '<CMD>Telescope media_files<CR>')

-- nvim-tree
utils.nnoremap('<LEADER>n', '<CMD>NvimTreeToggle<CR>')
require'nvim-tree'.setup({
  auto_close          = true,
  update_cwd          = true,
})

-- dashboard-nvim
vim.g.dashboard_default_executive ='telescope'
vim.g.dashboard_custom_header = {
    '',
    '⡿⠋⠄⣀⣀⣤⣴⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣌⠻⣿⣿',
    '⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠹⣿',
    '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠹',
    '⣿⣿⡟⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡛⢿⣿⣿⣿⣮⠛⣿⣿⣿⣿⣿⣿⡆',
    '⡟⢻⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣣⠄⡀⢬⣭⣻⣷⡌⢿⣿⣿⣿⣿⣿',
    '⠃⣸⡀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠈⣆⢹⣿⣿⣿⡈⢿⣿⣿⣿⣿',
    '⠄⢻⡇⠄⢛⣛⣻⣿⣿⣿⣿⣿⣿⣿⣿⡆⠹⣿⣆⠸⣆⠙⠛⠛⠃⠘⣿⣿⣿⣿',
    '⠄⠸⣡⠄⡈⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠁⣠⣉⣤⣴⣿⣿⠿⠿⠿⡇⢸⣿⣿⣿',
    '⠄⡄⢿⣆⠰⡘⢿⣿⠿⢛⣉⣥⣴⣶⣿⣿⣿⣿⣻⠟⣉⣤⣶⣶⣾⣿⡄⣿⡿⢸',
    '⠄⢰⠸⣿⠄⢳⣠⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣼⣿⣿⣿⣿⣿⣿⡇⢻⡇⢸',
    '⢷⡈⢣⣡⣶⠿⠟⠛⠓⣚⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢸⠇⠘',
    '⡀⣌⠄⠻⣧⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠛⠛⠛⢿⣿⣿⣿⣿⣿⡟⠘⠄⠄',
    '⣷⡘⣷⡀⠘⣿⣿⣿⣿⣿⣿⣿⣿⡋⢀⣠⣤⣶⣶⣾⡆⣿⣿⣿⠟⠁⠄⠄⠄⠄',
    '⣿⣷⡘⣿⡀⢻⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣿⣿⣿⣿⣷⡿⠟⠉⠄⠄⠄⠄⡄⢀',
    '⣿⣿⣷⡈⢷⡀⠙⠛⠻⠿⠿⠿⠿⠿⠷⠾⠿⠟⣛⣋⣥⣶⣄⠄⢀⣄⠹⣦⢹⣿',
    '',
}
vim.g.dashboard_custom_section = {
  a = {description = {' Find File          '}, command = 'Telescope find_files'},
  b = {description = {' Recently Used Files'}, command = 'Telescope oldfiles'},
}
vim.g.dashboard_custom_footer = { "Hello, pete" }

-- nvim-cmp
vim.o.completeopt = "menu,menuone,noselect"

local tabnine = require('cmp_tabnine.config')
tabnine:setup({
        max_lines = 1000;
        max_num_results = 20;
        sort = true;
})

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i' }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"]() == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  },
  sources = {
    {name = "buffer"},
    {name = "path"},
    {name = "nvim_lsp"},
    {name = "nvim_lua"},
    {name = "vsnip"},
    {name = "emoji"},
    {name = "cmp_tabnine"},
    {name = 'copilot'},
    {max_item_count = 5},
  },
  formatting = {
    format = require("lspkind").cmp_format({with_text = true, menu = ({
        buffer = "[Buffer]",
        path = "[Path]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        vsnip = "[Vsnip]",
        emoji = "[Emoji]",
        cmp_tabnine = "[TabNine]",
        latex_symbols = "[Latex]"
      })}),
  },
}

-- vim-vsnip
vim.g.vsnip_snippet_dir = vsnip_path
utils.nnoremap('gs', '<CMD>VsnipOpenSplit<CR>')
utils.imap_with_expr('<C-j>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"')
utils.smap_with_expr('<C-j>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"')
utils.imap_with_expr('<C-k>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-k>"')
utils.smap_with_expr('<C-k>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-k>"')

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
utils.nnoremap('<F2>', '<CMD>lua require\'dap\'.repl.toggle()<CR>')
utils.nnoremap('<F3>', '<CMD>lua require\'dap\'.run_last()<CR>')
utils.nnoremap('<F5>', '<CMD>lua require\'dap\'.continue()<CR>')
utils.nnoremap('<F8>', '<CMD>lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>')
utils.nnoremap('<LEADER><F8>', '<CMD>lua require\'dap\'.set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<CR>')
utils.nnoremap('<F9>', '<CMD>lua require\'dap\'.toggle_breakpoint()<CR>')
utils.nnoremap('<F10>', '<CMD>lua require\'dap\'.step_over()<CR>')
utils.nnoremap('<F11>', '<CMD>lua require\'dap\'.step_into()<CR>')
utils.nnoremap('<F12>', '<CMD>lua require\'dap\'.step_out()<CR>')

-- nvim-dap-ui
require("dapui").setup()

-- nvim-dap-virtual-text
require("nvim-dap-virtual-text").setup()

-- neoscroll.vim
require('neoscroll').setup({
  -- All these keys will be mapped. Pass an empty table ({}) for no mappings
  mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>'},
  hide_cursor = true,          -- Hide cursor while scrolling
  stop_eof = true,             -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  easing = false,              -- easing_function will be used in all scrolling animations with some defaults
  easing_function = function(x) return math.pow(x, 2) end -- default easing function
})

-- vim-doge
vim.g.doge_mapping = '<LEADER>d'

-- vim-header
vim.g.header_auto_add_header = 0
vim.g.header_field_author = 'rainbowhxch'
vim.g.header_field_author_email = 'https://github.com/rainbowhxch'
vim.g.header_field_license_id = 'MIT'
vim.g.header_field_modified_by = 0
vim.g.header_field_modified_timestamp = 0

-- nvim-spectre
utils.nnoremap('<LEADER>S', '<CMD>lua require(\'spectre\').open()<CR>')

-- nvim-workbench
vim.g.workbench_storage_path = os.getenv("HOME") .. "/Documents/Notes/"
utils.nmap('<LEADER>bp', '<Plug>ToggleProjectWorkbench')
utils.nmap('<LEADER>bb', '<Plug>ToggleBranchWorkbench')

-- nvim-lsputils
vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler

-- bullets.vim
vim.g.bullets_enable_in_empty_buffers = 0
vim.g.bullets_enabled_file_types = {
  'markdown',
}

-- todo-comments.nvim
require("todo-comments").setup{}
utils.nnoremap('<LEADER>td', '<CMD>TodoTelescope<CR>')

-- zen-mode.nvim
require("zen-mode").setup{
  on_open = function()
    vim.api.nvim_command('Limelight')
  end;
  on_close = function()
    vim.api.nvim_command('Limelight!')
  end;
}
utils.nnoremap('<LEADER>zm', '<CMD>ZenMode<CR>')

-- nvim-comment-frame
require('nvim-comment-frame').setup({
    keymap = '<leader>cc',
    multiline_keymap = '<leader>C',
})

-- marks.nvim
require'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions.
  -- higher values will have better performance but may cause visual lag,
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "hello world"
  },
  mappings = {}
}

-- nvim-neoclip.lua
require('neoclip').setup()

-- copilot.vim
utils.imap_with_expr('<C-Space>', 'copilot#Accept("\\<CR>")')
vim.g.copilot_no_tab_map = true

-- FTerm.nvim
utils.nnoremap('<F1>', '<CMD>lua require("FTerm").toggle()<CR>')
utils.tnoremap('<F1>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- vim-floaterm
utils.nnoremap('<LEADER>gi', '<CMD>FloatermNew --autoclose=1 lazygit<CR>')
utils.nnoremap('<LEADER>rg', '<CMD>FloatermNew --autoclose=1 --width=0.8 --height=0.8 rg<CR>')

-- vista.vim
vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}
vim.g.vista_default_executive = 'nvim_lsp'
vim.g['vista#renderer#enable_icon'] = 1

-- colorscheme
-- onedark
vim.g.onedark_disable_toggle_style = true
-- require('onedark').setup()

-- gruvbox8
-- vim.cmd [[colorscheme gruvbox8]]

-- deus
-- vim.cmd [[colorscheme deus]]

-- starry.nvim
vim.cmd [[colorscheme earlysummer]]
