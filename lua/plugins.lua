local fn = vim.fn
local utils = require('utils')
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local vsnip_path = fn.stdpath('config') .. '/snippets/'

if fn.empty(fn.glob(install_path)) > 0 then
    vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.api.nvim_command('packadd packer.nvim')
end

vim.cmd('autocmd BufWritePost plugins.lua PackerCompile') -- Auto compile when there are changes in plugins.lua
vim.g.gruvbox_italic = 1
vim.g.gruvbox_italicize_strings = 1
vim.g.gruvbox_invert_signs = 1
vim.g.gruvbox_invert_indent_guides = 1
vim.g.gruvbox_invert_tabline = 1
-- vim.g.gruvbox_improved_strings = 1
vim.g.gruvbox_improved_warnings = 1

vim.cmd('colorscheme gruvbox')

-- nvim-autopairs
require('nvim-autopairs').setup()

-- barbar.nvim
utils.nnoremap('sb', '<Cmd>BufferPick<CR>')
utils.nnoremap(']b', '<Cmd>BufferNext<CR>')
utils.nnoremap('[b', '<Cmd>BufferPrevious<CR>')
utils.nnoremap('H', '<Cmd>BufferClose<CR>')

-- Use accelerated-jk for normal up/down movement
utils.nmap('j', '<Plug>(accelerated_jk_gj)')
utils.nmap('k', '<Plug>(accelerated_jk_gk)')

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
  },
  context_commentstring = {
    enable = true,
  },
}

-- formatter.nvim
require('formatter').setup({
  logging = false,
  filetype = {
    c = {
       function()
          return {
            exe = "clang-format",
            args = {"--style=Google"},
            stdin = true
          }
        end
    },
    cpp = {
      function()
        return {
          exe = "clang-format",
          args = {"--style=Google"},
          stdin = true
        }
      end
    },
    python =  {
      function()
        return {
          exe = "autopep8",
          args = {""},
          stdin = true
        }
      end
    },
    json =  {
      function()
        return {
          exe = "fixjson",
          args = {""},
          stdin = true
        }
      end
    },
    markdown =  {
      function()
        return {
          exe = "remark",
          args = {""},
          stdin = true
        }
      end
    },
  }
})

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

-- context.vim
vim.g.context_add_mappings = 0
utils.nnoremap('<LEADER>ct', '<CMD>ContextToggle<CR>')

-- nvim-hlslens
utils.nnoremap('n', '<Cmd>execute(\'normal! \' . v:count1 . \'n\')<CR><Cmd>lua require(\'hlslens\').start()<CR>')
utils.nnoremap('N', '<Cmd>execute(\'normal! \' . v:count1 . \'N\')<CR><Cmd>lua require(\'hlslens\').start()<CR>')
utils.nnoremap('*', '*<Cmd>lua require(\'hlslens\').start()<CR>')
utils.nnoremap('#', '#<Cmd>lua require(\'hlslens\').start()<CR>')
utils.nnoremap('g*', 'g*<Cmd>lua require(\'hlslens\').start()<CR>')
utils.nnoremap('g#', 'g#<Cmd>lua require(\'hlslens\').start()<CR>')

-- galaxyline.nvim
require('eviline')

-- accelerated-jk
utils.nmap('j', '<Plug>(accelerated_jk_gj)')
utils.nmap('k', '<Plug>(accelerated_jk_gk)')

-- echodoc.vim
vim.g.echodoc_enable_at_startup = 1

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

-- any-jump.vim
vim.g.any_jump_disable_default_keybindings = 1
utils.nnoremap('gj', '<CMD>HeaderguardAdd<CR>')

-- vim-which-key
utils.nnoremap('<LEADER>', '<CMD>WhichKey \'<SPACE>\'<CR>')

-- far.vim
utils.nnoremap('ss', '<CMD>Farp<CR>')
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

-- vim-matchup
vim.g.matchup_text_obj_enabled = 0
vim.g.matchup_mappings_enabled = 1
vim.g.matchup_override_vimtex = 1
utils.xmap('a%', '<plug>(matchup-%)')
utils.xmap('i%', '<plug>(matchup-%)')

-- vim-floaterm
vim.g.floaterm_keymap_toggle = '<F1>'
utils.nnoremap('<LEADER>gi', '<CMD>FloatermNew --autoclose=1 lazygit<CR>')
utils.nnoremap('<LEADER>R', '<CMD>FloatermNew --autoclose=1 ranger<CR>')
utils.nnoremap('<LEADER>rg', '<CMD>FloatermNew --autoclose=1 --width=0.8 --height=0.8 rg<CR>')

-- vim-surround
utils.nmap('<LEADER>"', 'ysiW"')
utils.nmap('<LEADER>\'', 'ysiW\'')
utils.nmap('<LEADER>(', 'ysiW)')
utils.nmap('<LEADER>{', 'ysiW{')
utils.nmap('<LEADER>[', 'ysiW[')
utils.nmap('<LEADER>/', 'ysiW*ysiW/f*a<SPACE><ESC>f*i<SPACE><ESC>b')

-- vimtex
local cache_dir = os.getenv("HOME") .. '/.cache/nvim/'
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

-- vista
utils.nnoremap('T', '<CMD>MinimapClose<CR><CMD>Vista!!<CR>')
vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}
vim.g.vista_default_executive = 'ctags'
vim.g.vista_fzf_preview = {'right:50%'}
vim.g['vista#renderer#enable_icon'] = 1

-- vim-signature
vim.g.SignatureMap = {
  Leader             =  'm';
  PlaceNextMark      =  'm,';
  ToggleMarkAtLine   =  'm.';
  PurgeMarksAtLine   =  'm-';
  DeleteMark         =  'dm';
  PurgeMarks         =  'm<SPACE>';
  PurgeMarkers       =  'm<BS>';
  GotoNextLineAlpha  =  '';
  GotoPrevLineAlpha  =  '';
  GotoNextSpotAlpha  =  '';
  GotoPrevSpotAlpha  =  '';
  GotoNextLineByPos  =  '';
  GotoPrevLineByPos  =  '';
  GotoNextSpotByPos  =  '';
  GotoPrevSpotByPos  =  '';
  GotoNextMarker     =  ']-';
  GotoPrevMarker     =  '[-';
  GotoNextMarkerAny  =  '';
  GotoPrevMarkerAny  =  '';
  ListBufferMarks    =  'm/';
  ListBufferMarkers  =  'm?';
}

-- hop.nvim
-- sf{char} to move to {char}
utils.nnoremap('sf', '<CMD>HopChar1<CR>')
utils.vnoremap('sf', '<CMD>HopChar1<CR>')
-- Move to line
utils.nnoremap('sL', '<CMD>HopLine<CR>')
utils.vnoremap('sL', '<CMD>HopLine<CR>')

-- suda.vim
utils.nnoremap('<LEADER>S', '<CMD>SudaWrite<CR>')
vim.g['suda#prompt'] = '(. > .) password please: '
vim.g.suda_smart_edit = 1

-- asyncrun.vim
vim.g.asyncrun_open = 6
vim.g.asyncrun_rootmarks = {'.git', '.svn', '.root', '.project' }

-- asynctasks.vim
vim.g.asynctasks_term_pos = 'floaterm_reuse'
utils.nnoremap('<F6>', '<CMD>AsyncTask file-build<CR>')
utils.nnoremap('<F7>', '<CMD>lua require(\'utils\').FileRun()<CR>')
utils.nnoremap('<LEADER><F6>', '<CMD>AsyncTask project-build<CR>')
utils.nnoremap('<LEADER><F7>', '<CMD>AsyncTask project-run<CR>')

-- goyo.vim
utils.nnoremap('<LEADER>gy', '<CMD>Goyo<CR>')
vim.g.goyo_width = '80'
vim.g.goyo_height = '80%'

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
  use_decoration_api = true,
  use_internal_diff = true,  -- If luajit is present
}

-- indentLine
vim.g.indent_blankline_buftype_exclude = {'terminal'}
vim.g.indent_blankline_filetype_exclude = {'help', 'startify', 'dashboard', 'packer', 'neogitstatus'}
vim.g.indent_blankline_char = '▏'
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {
    'class', 'return', 'function', 'method', '^if', '^while', 'jsx_element', '^for', '^object', '^table', 'block',
    'arguments', 'if_statement', 'else_clause', 'jsx_element', 'jsx_self_closing_element', 'try_statement',
    'catch_clause', 'import_statement', 'operation_type'
}

-- nvim-telescope
local actions = require('telescope.actions')
require('telescope').load_extension('media_files')
require('telescope').setup {
 defaults = {
    vimgrep_arguments = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
    prompt_position = "top",
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {horizontal = {mirror = false}, vertical = {mirror = false}},
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        -- To disable a keymap, put [map] = false
        -- So, to not map "<C-n>", just put
        -- ["<c-x>"] = false,
        ["<esc>"] = actions.close,

        -- Otherwise, just set the mapping to the function that you want it to be.
        -- ["<C-i>"] = actions.select_horizontal,

        -- Add up multiple actions
        ["<CR>"] = actions.select_default + actions.center

        -- You can perform as many actions in a row as you like
        -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        -- ["<C-i>"] = my_cool_custom_action,
      }
    }
  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
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
vim.g.nvim_tree_disable_netrw = 0 --"1 by default, disables netrw
vim.g.nvim_tree_hide_dotfiles = 1 --0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_indent_markers = 1 --"0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_follow = 1 --"0 by default, this option allows the cursor to be updated when entering a buffer
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  ["<CR>"]           = tree_cb("edit"),
  ["o"]              = tree_cb("edit"),
  ["<2-LeftMouse>"]  = tree_cb("edit"),
  ["<2-RightMouse>"] = tree_cb("cd"),
  ["<l>"]            = tree_cb("cd"),
  ["<v>"]            = tree_cb("vsplit"),
  ["<s>"]            = tree_cb("split"),
  ["<t>"]            = tree_cb("tabnew"),
  ["<BS>"]           = tree_cb("close_node"),
  ["<S-CR>"]         = tree_cb("close_node"),
  ["<Tab>"]          = tree_cb("preview"),
  ["I"]              = tree_cb("toggle_ignored"),
  ["H"]              = tree_cb("toggle_dotfiles"),
  ["<C-r>"]          = tree_cb("refresh"),
  ["a"]              = tree_cb("create"),
  ["d"]              = tree_cb("remove"),
  ["r"]              = tree_cb("rename"),
  ["R"]              = tree_cb("full_rename"),
  ["c"]              = tree_cb("cut"),
  ["y"]              = tree_cb("copy"),
  ["p"]              = tree_cb("paste"),
  ["[g"]             = tree_cb("prev_git_item"),
  ["]g"]             = tree_cb("next_git_item"),
  ["h"]              = tree_cb("dir_up"),
  ["q"]              = tree_cb("close"),
}
vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = "",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = ""
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = ""
  }
}

-- dashboard-nvim
vim.g.dashboard_default_executive ='telescope'
vim.g.dashboard_custom_header = {
  '     ⠀⠀⠀⠀⠀⠀⠀⡴⠞⠉⢉⣭⣿⣿⠿⣳⣤⠴⠖⠛⣛⣿⣿⡷⠖⣶⣤⡀⠀⠀⠀  ',
  '   ⠀⠀⠀⠀⠀⠀⠀⣼⠁⢀⣶⢻⡟⠿⠋⣴⠿⢻⣧⡴⠟⠋⠿⠛⠠⠾⢛⣵⣿⠀⠀⠀⠀  ',
  '   ⣼⣿⡿⢶⣄⠀⢀⡇⢀⡿⠁⠈⠀⠀⣀⣉⣀⠘⣿⠀⠀⣀⣀⠀⠀⠀⠛⡹⠋⠀⠀⠀⠀  ',
  '   ⣭⣤⡈⢑⣼⣻⣿⣧⡌⠁⠀⢀⣴⠟⠋⠉⠉⠛⣿⣴⠟⠋⠙⠻⣦⡰⣞⠁⢀⣤⣦⣤⠀  ',
  '   ⠀⠀⣰⢫⣾⠋⣽⠟⠑⠛⢠⡟⠁⠀⠀⠀⠀⠀⠈⢻⡄⠀⠀⠀⠘⣷⡈⠻⣍⠤⢤⣌⣀  ',
  '   ⢀⡞⣡⡌⠁⠀⠀⠀⠀⢀⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀⠀⠸⣇⠀⢾⣷⢤⣬⣉  ',
  '   ⡞⣼⣿⣤⣄⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿⠀⠸⣿⣇⠈⠻  ',
  '   ⢰⣿⡿⢹⠃⠀⣠⠤⠶⣼⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿⠀⠀⣿⠛⡄⠀  ',
  '   ⠈⠉⠁⠀⠀⠀⡟⡀⠀⠈⡗⠲⠶⠦⢤⣤⣤⣄⣀⣀⣸⣧⣤⣤⠤⠤⣿⣀⡀⠉⣼⡇⠀  ',
  '   ⣿⣴⣴⡆⠀⠀⠻⣄⠀⠀⠡⠀⠀⠀⠈⠛⠋⠀⠀⠀⡈⠀⠻⠟⠀⢀⠋⠉⠙⢷⡿⡇⠀  ',
  '   ⣻⡿⠏⠁⠀⠀⢠⡟⠀⠀⠀⠣⡀⠀⠀⠀⠀⠀⢀⣄⠀⠀⠀⠀⢀⠈⠀⢀⣀⡾⣴⠃⠀  ',
  '   ⢿⠛⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⠈⠢⠄⣀⠠⠼⣁⠀⡱⠤⠤⠐⠁⠀⠀⣸⠋⢻⡟⠀⠀  ',
  '   ⠈⢧⣀⣤⣶⡄⠘⣆⠀⠀⠀⠀⠀⠀⠀⢀⣤⠖⠛⠻⣄⠀⠀⠀⢀⣠⡾⠋⢀⡞⠀⠀⠀  ',
  '   ⠀⠀⠻⣿⣿⡇⠀⠈⠓⢦⣤⣤⣤⡤⠞⠉⠀⠀⠀⠀⠈⠛⠒⠚⢩⡅⣠⡴⠋⠀⠀⠀⠀  ',
  '   ⠀⠀⠀⠈⠻⢧⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣻⠿⠋⠀⠀⠀⠀⠀⠀  ',
  '   ⠀⠀⠀⠀⠀⠀⠉⠓⠶⣤⣄⣀⡀⠀⠀⠀⠀⠀⢀⣀⣠⡴⠖⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀  ',
}
vim.g.dashboard_custom_section = {
  a = {description = {' Find File          '}, command = 'Telescope find_files'},
  b = {description = {' Recently Used Files'}, command = 'Telescope oldfiles'},
  c = {description = {' Load Last Session  '}, command = 'SessionLoad'},
  d = {description = {' Find Word          '}, command = 'Telescope live_grep'},
  e = {description = {' Settings           '}, command = ':e ~/.config/nvim/init.vim'}
}
vim.g.dashboard_custom_footer = { "Welcome to RainbowCh's Nvim!" }

-- dial.nvim
utils.nmap('<C-a>', '<Plug>(dial-increment)')
utils.nmap('<C-x>', '<Plug>(dial-decrement)')
utils.vmap('<C-a>', '<Plug>(dial-increment)')
utils.vmap('<C-x>', '<Plug>(dial-decrement)')

-- nvim-compe
vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;
  source = {
    path = {kind = "  "},
    buffer = {kind = "  "},
    calc = {kind = "  "},
    vsnip = {kind = "  "},
    nvim_lsp = {kind = "  "},
    nvim_lua = {kind = "  "},
    spell = {kind = "  "},
    tags = true,
    -- snippets_nvim = {kind = "  "},
    -- ultisnips = {kind = "  "},
    -- treesitter = {kind = "  "},
    emoji = {kind = " ﲃ ", filetypes={"markdown"}}
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

utils.imap_with_expr("<Tab>", "v:lua.tab_complete()")
utils.smap_with_expr("<Tab>", "v:lua.tab_complete()")
utils.imap_with_expr("<S-Tab>", "v:lua.s_tab_complete()")
utils.smap_with_expr("<S-Tab>", "v:lua.s_tab_complete()")

-- compatible with nvim-autopairs
local npairs = require('nvim-autopairs')
_G.MUtils= {}
vim.g.completion_confirm_key = ""

MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      vim.fn["compe#confirm"]()
      return npairs.esc("<c-y>")
    else
      vim.defer_fn(function()
        vim.fn["compe#confirm"]("<cr>")
      end, 20)
      return npairs.esc("<c-n>")
    end
  else
    return npairs.check_break_line_char()
  end
end

utils.inoremap_with_expr('<CR>','v:lua.MUtils.completion_confirm()')

-- vim-vsnip
vim.g.vsnip_snippet_dir = vsnip_path

-- nvim-dap
local dap = require('dap')
dap.adapters.cpp = {
  type = 'executable',
  attach = {
    pidProperty = "pid",
    pidSelect = "ask"
  },
  command = 'lldb-vscode',
  env = {
    LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
  },
  name = "lldb"
}
dap.configurations.cpp = {
  {
    type = 'cpp';
    request = 'launch';
    name = "Launch file";
    program = vim.fn.expand('%:p:r');
    cwd = vim.fn.getcwd();
  },
  {
    type = "cpp";
    request = "attach";
    name = "Attach File";
    program = vim.fn.expand('%:p:r');
    cwd = vim.fn.getcwd();
  }
}
dap.defaults.fallback.external_terminal = {
  command = '/usr/local/bin/st';
  args = {'-e'};
}

vim.fn.sign_define('DapBreakpoint', {text='B', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='L', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='→', texthl='', linehl='', numhl=''})
vim.api.nvim_command('au FileType dap-repl lua require(\'dap.ext.autocompl\').attach()')
utils.nnoremap('<F3>', ':lua require\'dap\'.run_last()<CR>')
utils.nnoremap('<F5>', ':lua require\'dap\'.continue()<CR>')
utils.nnoremap('<F6>', ':lua require\'dap\'.repl.toggle()<CR>')
utils.nnoremap('<F7', ':lua require\'dap\'.set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<CR>')
utils.nnoremap('<F8>', ':lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>')
utils.nnoremap('<F9>', ':lua require\'dap\'.toggle_breakpoint()<CR>')
utils.nnoremap('<F10>', ':lua require\'dap\'.step_over()<CR>')
utils.nnoremap('<F11>', ':lua require\'dap\'.step_into()<CR>')
utils.nnoremap('<F12>', ':lua require\'dap\'.step_out()<CR>')

-- nvim-dap-virtual-text
vim.g.dap_virtual_text = true

return require('packer').startup(function(use)
  -- packer.nvim itself
  use 'wbthomason/packer.nvim'

  -- decoration
  use 'windwp/nvim-autopairs'
  use { 'lukas-reineke/indent-blankline.nvim', branch = 'lua' }
  use 'kyazdani42/nvim-web-devicons'
  use 'glepnir/dashboard-nvim'
  use 'glepnir/galaxyline.nvim'
  use 'romgrk/barbar.nvim'
  use 'aklt/plantuml-syntax'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'p00f/nvim-ts-rainbow', requires = {'nvim-treesitter/nvim-treesitter'} }
  use { 'windwp/nvim-ts-autotag', requires = {'nvim-treesitter/nvim-treesitter'} }
  use { 'JoosepAlviste/nvim-ts-context-commentstring', requires = {'nvim-treesitter/nvim-treesitter'} }
  use 'norcalli/nvim-colorizer.lua'
  use 'wfxr/minimap.vim'
  use 'karb94/neoscroll.nvim'

  -- reading mode
  use { 'junegunn/goyo.vim', cmd = 'Goyo' }
  use { 'junegunn/limelight.vim', cmd = 'Goyo' }

  -- functional
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
  use { 'nvim-telescope/telescope-media-files.nvim', requires = {'nvim-telescope/telescope.nvim'} }
  use { 'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'} }
  use 'honza/vim-snippets'
  use {'iamcco/markdown-preview.nvim', ft = {'markdown'}, run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  use { 'mzlogin/vim-markdown-toc', ft = {'markdown'} }
  use { 'dhruvasagar/vim-table-mode', ft = {'markdown'} }
  use { 'lervag/vimtex', ft = {'tex'} }
  use 'junegunn/vim-easy-align'
  use 'liuchengxu/vista.vim'
  use 'kshenoy/vim-signature'
  use 'phaazon/hop.nvim'
  use 'MattesGroeger/vim-bookmarks'
  use 'lambdalisue/suda.vim'
  use 'skywind3000/asynctasks.vim'
  use 'skywind3000/asyncrun.vim'
  use 'voldikss/vim-floaterm'
  use 'tpope/vim-surround'
  use 'AndrewRadev/splitjoin.vim'
  use 'andymass/vim-matchup'
  use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'} }
  use 'terrortylor/nvim-comment'
  use 'tpope/vim-repeat'
  use 'brooth/far.vim'
  use 'liuchengxu/vim-which-key'
  use { 'pechorin/any-jump.vim', cmd = {'AnyJump'} }
  use { 'drmikehenry/vim-headerguard', ft = {'c', 'cpp'}, cmd = {'HeaderguardAdd'} }
  use { 'mbbill/undotree', cmd = {'UndotreeToggle'} }
  use 'unblevable/quick-scope'
  use 'Shougo/echodoc.vim'
  use 'rhysd/accelerated-jk'
  use 'wellle/context.vim'
  use 'kevinhwang91/nvim-hlslens'
  use 'junegunn/vim-peekaboo'
  use 'mhartington/formatter.nvim'
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
  use 'monaqa/dial.nvim'
  use 'metakirby5/codi.vim'
  use 'michaelb/sniprun'
  use 'mfussenegger/nvim-dap'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'

  -- autocompletor
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
  use "rafamadriz/friendly-snippets"
  use 'hrsh7th/vim-vsnip-integ'

  -- themes
  use 'morhetz/gruvbox'
end)
