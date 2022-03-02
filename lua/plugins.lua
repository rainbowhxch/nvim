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
  -- use { 'glepnir/dashboard-nvim' }
  -- use { 'glepnir/galaxyline.nvim' }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons'} }
  use { 'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'} }
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
  use { 'folke/zen-mode.nvim', requires = {'folke/twilight.nvim'} }

  -- functional
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}} }
  use { 'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'} }
  use { 'iamcco/markdown-preview.nvim', ft = {'markdown'}, run = 'cd app && yarn install', cmd = 'MarkdownPreview' }
  use { 'mzlogin/vim-markdown-toc', ft = {'markdown'}, cmd = {'GenTocGFM'} }
  use { 'dhruvasagar/vim-table-mode', ft = {'markdown'} }
  use { 'lervag/vimtex', ft = {'tex'} }
  use { 'junegunn/vim-easy-align' }
  use { 'MattesGroeger/vim-bookmarks' }
  use { 'lambdalisue/suda.vim' }
  use { 'tpope/vim-surround' }
  use { 'terrortylor/nvim-comment' }
  use { 'drmikehenry/vim-headerguard', ft = {'c', 'cpp'}, cmd = {'HeaderguardAdd'} }
  use { 'mbbill/undotree', cmd = {'UndotreeToggle'} }
  use { 'rhysd/accelerated-jk' }
  use { 'metakirby5/codi.vim' }
  use { 'mfussenegger/nvim-dap' }
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use { 'theHamsta/nvim-dap-virtual-text' }
  use { 'kevinhwang91/nvim-bqf' }
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
  use { "rcarriga/nvim-notify" }
  use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }
  use { "danymat/neogen", requires = "nvim-treesitter/nvim-treesitter" }
  use { "ThePrimeagen/refactoring.nvim", requires = {{"nvim-lua/plenary.nvim"}, {"nvim-treesitter/nvim-treesitter"}} }
  use { "Julian/vim-textobj-variable-segment", requires = {"kana/vim-textobj-user"} }
  use { 'ggandor/lightspeed.nvim' }
  use { 'akinsho/toggleterm.nvim' }
  use { "Badhi/nvim-treesitter-cpp-tools", requires = {{"nvim-treesitter/nvim-treesitter"}} }
  use { 'ray-x/go.nvim' }
  use { 'olimorris/onedarkpro.nvim' }
  use { 'natecraddock/workspaces.nvim' }
  use { 'natecraddock/sessions.nvim' }
  use { 'RRethy/nvim-treesitter-endwise' }

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
      { "hrsh7th/cmp-copilot" },
      { "hrsh7th/cmp-cmdline" },
      { 'uga-rosa/cmp-dictionary' },
      { "tzachar/cmp-tabnine", run = "./install.sh" },
      { 'andersevenrud/cmp-tmux' },
    }
  }
  use { "github/copilot.vim" }
  use { 'hrsh7th/vim-vsnip' }
  use { "rafamadriz/friendly-snippets" }
  use { 'liuchengxu/vista.vim' }

  -- themes
  use { 'monsonjeremy/onedark.nvim' }
  -- use { 'ajmwagar/vim-deus' }
  use { "lifepillar/vim-gruvbox8" }
  use { "projekt0n/github-nvim-theme" }
  use { 'folke/tokyonight.nvim' }
  use { 'theniceboy/nvim-deus' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- nvim-autopairs
require('nvim-autopairs').setup()
-- add space rule to autopairs
local npairs = require'nvim-autopairs'
local Rule   = require'nvim-autopairs.rule'
npairs.add_rules {
  Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
  Rule('( ', ' )')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%)') ~= nil
      end)
      :use_key(')'),
  Rule('{ ', ' }')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%}') ~= nil
      end)
      :use_key('}'),
  Rule('[ ', ' ]')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%]') ~= nil
      end)
      :use_key(']')
}

-- barbar.nvim
utils.nnoremap(';b', '<Cmd>BufferPick<CR>')
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
    extended_mode = true,
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
  endwise = {
      enable = true,
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

-- lualine.nvim
require('bubbles')
-- require('lualine').setup {
--   options = {
--     theme = 'tokyonight'
--   }
-- }

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

-- suda.vim
vim.g['suda#prompt'] = '(. > .) password please: '

-- custom file_run function
utils.nnoremap('<F7>', '<CMD>lua require(\'utils\').file_run()<CR>')

-- gitsigns.nvim
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '▎', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '▎', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '契', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '契', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  keymaps = {
    noremap = true,
    buffer = true,
    ['n ]g'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
    ['n [g'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},
    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
  },
}

-- indentLine
vim.g.indent_blankline_buftype_exclude = {'terminal'}
vim.g.indent_blankline_filetype_exclude = {'help', 'startify', 'dashboard', 'packer', 'neogitstatus', ''}
vim.g.indent_blankline_char = '▏'
vim.g.indent_blankline_context_char = '┃'
-- vim.g.indent_blankline_space_char_blankline = ' '
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
require('telescope').load_extension("workspaces")
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
utils.nnoremap('<LEADER>fw', '<CMD>Telescope workspaces<CR>')
utils.nnoremap('<LEADER>ft', '<CMD>Telescope tags<CR>')
utils.nnoremap('<LEADER>fm', '<CMD>Telescope marks<CR>')
utils.nnoremap('<LEADER>fo', '<CMD>Telescope oldfiles<CR>')
utils.nnoremap('<LEADER>fM', '<CMD>Telescope keymaps<CR>')
utils.nnoremap('<LEADER>fp', '<CMD>Telescope media_files<CR>')

-- nvim-tree
utils.nnoremap('<LEADER>n', '<CMD>NvimTreeToggle<CR>')
vim.g.nvim_tree_quit_on_open = 1
require'nvim-tree'.setup({
  auto_close          = true,
})

-- dashboard-nvim
-- vim.g.dashboard_default_executive ='telescope'
-- vim.g.dashboard_custom_header = {
--     '',
--     '⡿⠋⠄⣀⣀⣤⣴⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣌⠻⣿⣿',
--     '⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠹⣿',
--     '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠹',
--     '⣿⣿⡟⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡛⢿⣿⣿⣿⣮⠛⣿⣿⣿⣿⣿⣿⡆',
--     '⡟⢻⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣣⠄⡀⢬⣭⣻⣷⡌⢿⣿⣿⣿⣿⣿',
--     '⠃⣸⡀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠈⣆⢹⣿⣿⣿⡈⢿⣿⣿⣿⣿',
--     '⠄⢻⡇⠄⢛⣛⣻⣿⣿⣿⣿⣿⣿⣿⣿⡆⠹⣿⣆⠸⣆⠙⠛⠛⠃⠘⣿⣿⣿⣿',
--     '⠄⠸⣡⠄⡈⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠁⣠⣉⣤⣴⣿⣿⠿⠿⠿⡇⢸⣿⣿⣿',
--     '⠄⡄⢿⣆⠰⡘⢿⣿⠿⢛⣉⣥⣴⣶⣿⣿⣿⣿⣻⠟⣉⣤⣶⣶⣾⣿⡄⣿⡿⢸',
--     '⠄⢰⠸⣿⠄⢳⣠⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣼⣿⣿⣿⣿⣿⣿⡇⢻⡇⢸',
--     '⢷⡈⢣⣡⣶⠿⠟⠛⠓⣚⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢸⠇⠘',
--     '⡀⣌⠄⠻⣧⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠛⠛⠛⢿⣿⣿⣿⣿⣿⡟⠘⠄⠄',
--     '⣷⡘⣷⡀⠘⣿⣿⣿⣿⣿⣿⣿⣿⡋⢀⣠⣤⣶⣶⣾⡆⣿⣿⣿⠟⠁⠄⠄⠄⠄',
--     '⣿⣷⡘⣿⡀⢻⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣿⣿⣿⣿⣷⡿⠟⠉⠄⠄⠄⠄⡄⢀',
--     '⣿⣿⣷⡈⢷⡀⠙⠛⠻⠿⠿⠿⠿⠿⠷⠾⠿⠟⣛⣋⣥⣶⣄⠄⢀⣄⠹⣦⢹⣿',
--     '',
-- }
-- vim.g.dashboard_custom_section = {
--   a = {description = {' Find File          '}, command = 'Telescope find_files'},
--   b = {description = {' Recently Used Files'}, command = 'Telescope oldfiles'},
-- }
-- vim.g.dashboard_custom_footer = { "Hello, pete" }

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
local neogen = require('neogen')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
cmp.setup({
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
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif neogen.jumpable() then
        feedkey("<cmd>lua require('neogen').jump_next()<CR>", "")
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
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    {name = "buffer"},
    {name = "path"},
    {name = "nvim_lsp"},
    {name = "nvim_lua"},
    {name = "vsnip"},
    {name = "emoji"},
    {name = "cmp_tabnine"},
    {
      name = "dictionary",
      keyword_length = 2,
    },
    {name = 'copilot'},
    {name = 'tmux'},
    {max_item_count = 5},
  }),
  formatting = {
    format = require("lspkind").cmp_format({with_text = true, menu = ({
        buffer = "[Buffer]",
        path = "[Path]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        vsnip = "[Vsnip]",
        emoji = "[Emoji]",
        cmp_tabnine = "[TabNine]",
        latex_symbols = "[Latex]",
        dictionary = "[Dictionary]",
        copilot = "[Copilot]",
        tmux = "[Tmux]",
      })}),
  },
})
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})
cmp.setup.cmdline(':', {
  sources = {
    { name = 'cmdline' }
  }
})

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
  mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zt', 'zz', 'zb'},
  hide_cursor = true,          -- Hide cursor while scrolling
  stop_eof = true,             -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  easing = false,              -- easing_function will be used in all scrolling animations with some defaults
  easing_function = function(x) return math.pow(x, 2) end, -- default easing function
  pre_hook = nil,                  -- Function to run before the scrolling animation starts
  post_hook = nil,                 -- Function to run after the scrolling animation ends
})

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
require("zen-mode").setup{}
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
utils.nnoremap('<LEADER>fy', '<CMD>Telescope neoclip<CR>')

-- copilot.vim
utils.imap_with_expr('<C-Space>', 'copilot#Accept("\\<CR>")')
vim.g.copilot_no_tab_map = true

-- vista.vim
vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}
vim.g.vista_default_executive = 'nvim_lsp'
vim.g['vista#renderer#enable_icon'] = 1
utils.nnoremap('<C-t>', '<CMD>Vista!!<CR>')

-- neogen
require('neogen').setup{}

-- nvim-notify
vim.notify = require("notify")

-- toggleterm.nvim
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  dir = "git_dir",
  direction = "float",
  cmd = "lazygit",
  hidden = true
})
function _lazygit_toggle()
  lazygit:toggle()
end
utils.nnoremap('<LEADER>gi', '<CMD>lua _lazygit_toggle()<CR>')
utils.nnoremap('<F1>', '<CMD>ToggleTerm direction="float"<CR>')
utils.tnoremap('<F1>', '<CMD>ToggleTerm direction="float"<CR>')
require("toggleterm").setup{
  open_mapping = [[<C-\>]],
  direction = 'horizontal',
}

-- go.nvim
require('go').setup()

-- workspace.nvim
require("workspaces").setup({
  hooks = {
    open_pre = {
      "SessionsStop",
      "silent %bdelete!",
    },
    open = {
      function()
        require("sessions").load(nil, { silent = true })
      end
    }
  },
})

-- sessions.nvim
require("sessions").setup({
    session_filepath = ".sessions",
  }
)
-- lightspeed.nvim
utils.nmap('s', '<Plug>Lightspeed_omni_s')

require("cmp_dictionary").setup({
    dic = {
        ["text"] = { "/home/ch/.config/nvim/dict/en.dict" },
    },
})
-- colorscheme

-- gruvbox8
vim.cmd [[colorscheme gruvbox8]]

-- deus
-- vim.cmd [[colorscheme deus]]

-- vim.cmd[[colorscheme tokyonight]]

local onedarkpro = require("onedarkpro")
onedarkpro.setup({
  -- Theme can be overwritten with 'onedark' or 'onelight' as a string
  theme = function()
    if vim.o.background == "dark" then
      return "onedark"
    else
      return "onelight"
    end
  end,
  colors = {}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
  hlgroups = {}, -- Override default highlight groups
  filetype_hlgroups = {}, -- Override default highlight groups for specific filetypes
  plugins = { -- Override which plugins highlight groups are loaded
      native_lsp = true,
      polygot = true,
      treesitter = true,
  },
  styles = {
      strings = "NONE", -- Style that is applied to strings
      comments = "italic", -- Style that is applied to comments
      keywords = "bold", -- Style that is applied to keywords
      functions = "NONE", -- Style that is applied to functions
      variables = "NONE", -- Style that is applied to variables
  },
  options = {
      bold = true, -- Use the themes opinionated bold styles?
      italic = true, -- Use the themes opinionated italic styles?
      underline = true, -- Use the themes opinionated underline styles?
      undercurl = true, -- Use the themes opinionated undercurl styles?
      cursorline = true, -- Use cursorline highlighting?
      transparency = false, -- Use a transparent background?
      terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
      window_unfocussed_color = true, -- When the window is out of focus, change the normal background?
  }
})
-- onedarkpro.load()
