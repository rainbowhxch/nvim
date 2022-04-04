local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local load_config = function(mod) require(mod) end

if fn.empty(fn.glob(install_path)) > 0 then
  PackerBootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
  -- packer.nvim itself
  use { 'wbthomason/packer.nvim' }

  -- decoration
  use { 'windwp/nvim-autopairs', config = load_config('plugins.nvim-autopairs') }
  use { 'lukas-reineke/indent-blankline.nvim', config = load_config('plugins.indent-blankline') }
  use { 'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' }, config = load_config('plugins.alpha-nvim') }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons'}, config = load_config('plugins.lualine') }
  use { 'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}, config = load_config('plugins.barbar') }
  use { 'aklt/plantuml-syntax' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = load_config('plugins.nvim-treesitter') }
  use { 'p00f/nvim-ts-rainbow', requires = {'nvim-treesitter/nvim-treesitter'} }
  use { 'windwp/nvim-ts-autotag', requires = {'nvim-treesitter/nvim-treesitter'} }
  use { 'JoosepAlviste/nvim-ts-context-commentstring', requires = {'nvim-treesitter/nvim-treesitter'} }
  use { 'nvim-treesitter/nvim-treesitter-textobjects', requires = {'nvim-treesitter/nvim-treesitter'} }
  -- use { 'romgrk/nvim-treesitter-context', requires = {'nvim-treesitter/nvim-treesitter'} }
  use { 'norcalli/nvim-colorizer.lua', config = load_config('plugins.nvim-colorizer') }
  use { 'wfxr/minimap.vim', cmd = {'MinimapToggle'} }
  use { 'karb94/neoscroll.nvim', config = load_config('plugins.neoscroll') }
  use { 'kevinhwang91/nvim-hlslens' }
  use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}, config = load_config('plugins.gitsigns') }
  use { 'stevearc/dressing.nvim' }
  -- use { 'danilamihailov/beacon.nvim' }

  -- reading mode
  use { 'folke/zen-mode.nvim', requires = {'folke/twilight.nvim'}, config = load_config('plugins.zen-mode') }

  -- functional
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}, config = load_config('plugins.nvim-telescope') }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}, config = load_config('plugins.nvim-tree') }
  use { 'iamcco/markdown-preview.nvim', ft = {'markdown'}, run = 'cd app && yarn install', cmd = 'MarkdownPreview', config = load_config('plugins.markdown-preview') }
  use { 'mzlogin/vim-markdown-toc', ft = {'markdown'}, cmd = {'GenTocGFM'}, config = load_config('plugins.vim-markdown-toc') }
  use { 'dhruvasagar/vim-table-mode', ft = {'markdown'}, config = load_config('plugins.vim-table-mode') }
  use { 'lervag/vimtex', ft = {'tex'}, config = load_config('plugins.vimtex') }
  use { 'junegunn/vim-easy-align', config = load_config('plugins.vim-easy-align') }
  use { 'MattesGroeger/vim-bookmarks', config = load_config('plugins.vim-bookmarks') }
  use { 'lambdalisue/suda.vim', config = load_config('plugins.suda') }
  use { 'tpope/vim-surround', config = load_config('plugins.vim-surround') }
  use { 'terrortylor/nvim-comment', config = load_config('plugins.nvim-comment') }
  use { 'drmikehenry/vim-headerguard', ft = {'c', 'cpp'}, cmd = {'HeaderguardAdd'}, config = load_config('plugins.vim-headerguard') }
  use { 'mbbill/undotree', cmd = {'UndotreeToggle'}, config = load_config('plugins.undotree') }
  use { 'rhysd/accelerated-jk', config = load_config('plugins.accelerated-jk') }
  use { 'metakirby5/codi.vim' }
  use { 'mfussenegger/nvim-dap', config = load_config('plugins.nvim-dap') }
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}, config = load_config('plugins.nvim-dap-ui') }
  use { 'theHamsta/nvim-dap-virtual-text', requires = {'mfussenegger/nvim-dap'}, config = load_config('plugins.nvim-dap-virtual-text') }
  use { 'kevinhwang91/nvim-bqf' }
  use { 'michaeljsmith/vim-indent-object' }
  use { 'alpertuna/vim-header', config = load_config('plugins.vim-header') }
  use { 'windwp/nvim-spectre', config = load_config('plugins.nvim-spectre') }
  use { 'marcushwz/nvim-workbench', config = load_config('plugins.nvim-workbench') }
  use { 'dkarter/bullets.vim', config = load_config('plugins.bullets') }
  use { 'triglav/vim-visual-increment' }
  use { 'mg979/vim-visual-multi' }
  use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim", config = load_config('plugins.todo-comments') }
  use { 's1n7ax/nvim-comment-frame', config = load_config('plugins.nvim-comment-frame') }
  use { "chentau/marks.nvim", config = load_config('plugins.marks') }
  use { "AckslD/nvim-neoclip.lua", requires = {'tami5/sqlite.lua', module = 'sqlite'}, config = load_config('plugins.nvim-neoclip') }
  use { "junegunn/vim-peekaboo" }
  use { "rcarriga/nvim-notify", config = load_config('plugins.nvim-notify') }
  use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }
  use { "danymat/neogen", requires = "nvim-treesitter/nvim-treesitter", config = load_config('plugins.neogen') }
  use { "ThePrimeagen/refactoring.nvim", requires = {{"nvim-lua/plenary.nvim"}, {"nvim-treesitter/nvim-treesitter"}} }
  use { "Julian/vim-textobj-variable-segment", requires = {"kana/vim-textobj-user"} }
  use { 'ggandor/lightspeed.nvim', config = load_config('plugins.lightspeed') }
  use { 'akinsho/toggleterm.nvim', config = load_config('plugins.toggleterm') }
  use { "Badhi/nvim-treesitter-cpp-tools", requires = {{"nvim-treesitter/nvim-treesitter"}} }
  use { 'ray-x/go.nvim', config = load_config('plugins.go') }
  use { 'natecraddock/workspaces.nvim', config = load_config('plugins.workspaces') }
  use { 'natecraddock/sessions.nvim', config = load_config('plugins.sessions') }
  use { 'RRethy/nvim-treesitter-endwise' }
  use { "SmiteshP/nvim-gps", requires = {"nvim-treesitter/nvim-treesitter"}, config = load_config('plugins.nvim-gps') }
  use { "axieax/urlview.nvim" }

  -- lsp
  use { 'neovim/nvim-lspconfig' }
  use { 'onsails/lspkind-nvim' }
  use { 'ray-x/lsp_signature.nvim' }
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
    },
    config = load_config('plugins.nvim-cmp')
  }
  use { "github/copilot.vim", requires = {'hrsh7th/nvim-cmp'}, config = load_config('plugins.copilot') }
  use { 'hrsh7th/vim-vsnip', requires = {'hrsh7th/nvim-cmp'}, config = load_config('plugins.vim-vsnip') }
  use { "rafamadriz/friendly-snippets" }
  use { 'liuchengxu/vista.vim', config = load_config('plugins.vista') }

  -- themes
  use { 'olimorris/onedarkpro.nvim' }
  use { 'EdenEast/nightfox.nvim' }
  use { 'monsonjeremy/onedark.nvim' }
  use { "lifepillar/vim-gruvbox8" }
  use { "projekt0n/github-nvim-theme" }
  use { 'folke/tokyonight.nvim' }
  use { 'rainbowhxch/nvim-deus' }
  use { 'mhdahmad/gruvbox.lua' }

  if PackerBootstrap then
    require('packer').sync()
  end
end)
