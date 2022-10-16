local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  PackerBootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
  -- packer.nvim itself
  use { 'wbthomason/packer.nvim' }

  -- improve performance
  use { 'lewis6991/impatient.nvim', config = function() require'plugins.impatient' end }

  -- decoration
  use { 'windwp/nvim-autopairs', config = function() require('plugins.nvim-autopairs') end }
  use { 'lukas-reineke/indent-blankline.nvim', config = function() require('plugins.indent-blankline') end }
  use { 'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' }, config = function() require('plugins.alpha-nvim') end }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons'}, config = function() require('plugins.lualine') end }
  use { 'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}, config = function() require('plugins.barbar') end }
  use { 'aklt/plantuml-syntax' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require('plugins.nvim-treesitter') end }
  use { 'p00f/nvim-ts-rainbow', requires = {'nvim-treesitter/nvim-treesitter'}, config = function() require('plugins.nvim-ts-rainbow') end }
  use { 'windwp/nvim-ts-autotag', requires = {'nvim-treesitter/nvim-treesitter'}, config = function() require('plugins.nvim-ts-autotag') end }
  use { 'JoosepAlviste/nvim-ts-context-commentstring', requires = {'nvim-treesitter/nvim-treesitter'}, config = function() require('plugins.nvim-ts-context-commentstring') end }
  use { 'nvim-treesitter/nvim-treesitter-textobjects', requires = {'nvim-treesitter/nvim-treesitter'}, config = function() require('plugins.nvim-treesitter-textobjects') end }
  use { 'RRethy/nvim-treesitter-endwise', requires = {'nvim-treesitter/nvim-treesitter'}, config = function() require('plugins.nvim-treesitter-endwise') end }
  use { 'lewis6991/nvim-treesitter-context', requires = {'nvim-treesitter/nvim-treesitter'}, config = function() require('plugins.nvim-treesitter-context') end }
  use { 'NvChad/nvim-colorizer.lua', config = function() require('plugins.nvim-colorizer') end }
  use { 'wfxr/minimap.vim', cmd = {'MinimapToggle'} }
  use { 'karb94/neoscroll.nvim', config = function() require('plugins.neoscroll') end }
  use { 'kevinhwang91/nvim-hlslens' }
  use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}, config = function() require('plugins.gitsigns') end }
  use { 'stevearc/dressing.nvim' }
  use { 'rainbowhxch/beacon.nvim' }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- reading mode
  use { 'folke/zen-mode.nvim', requires = {'folke/twilight.nvim'}, config = function() require('plugins.zen-mode') end }

  -- functional
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}, config = function() require('plugins.nvim-telescope') end }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', config = function() require('plugins.telescope-fzf-native') end }
  use { 'nvim-telescope/telescope-symbols.nvim', requires = {{'nvim-telescope/telescope.nvim'}} }
  use { 'iamcco/markdown-preview.nvim', ft = {'markdown'}, run = 'cd app && yarn install', cmd = 'MarkdownPreview', config = function() require('plugins.markdown-preview') end }
  use { 'mzlogin/vim-markdown-toc', ft = {'markdown'}, cmd = {'GenTocGFM'}, config = function() require('plugins.vim-markdown-toc') end }
  use { 'dhruvasagar/vim-table-mode', ft = {'markdown'}, config = function() require('plugins.vim-table-mode') end }
  use { 'lervag/vimtex', ft = {'tex'}, config = function() require('plugins.vimtex') end }
  use { 'junegunn/vim-easy-align', config = function() require('plugins.vim-easy-align') end }
  use { 'MattesGroeger/vim-bookmarks', config = function() require('plugins.vim-bookmarks') end }
  use { 'lambdalisue/suda.vim', config = function() require('plugins.suda') end }
  use { 'tpope/vim-surround', config = function() require('plugins.vim-surround') end }
  use { 'terrortylor/nvim-comment', config = function() require'plugins.nvim-comment' end }
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons', }, config = function() require'plugins.nvim-tree' end}
  use { 'drmikehenry/vim-headerguard', ft = {'c', 'cpp'}, cmd = {'HeaderguardAdd'}, config = function() require('plugins.vim-headerguard') end }
  use { 'mbbill/undotree', cmd = {'UndotreeToggle'}, config = function() require('plugins.undotree') end }
  use { 'rainbowhxch/accelerated-jk.nvim', config = function() require('plugins.accelerated-jk') end }
  use { 'metakirby5/codi.vim' }
  use { 'mfussenegger/nvim-dap', config = function() require'plugins.nvim-dap' end }
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}, confit = function() require'pligins.nvim-dap-ui' end }
  use { 'theHamsta/nvim-dap-virtual-text', requires = {'mfussenegger/nvim-dap'}, config = function() require'plugins.nvim-dap-virtual-text' end }
  use { 'folke/trouble.nvim', config = function() require'plugins.trouble' end }
  use { 'alpertuna/vim-header', ft = {'cpp'}, config = function() require'plugins.vim-header' end }
  use { 'windwp/nvim-spectre', config = function() require'plugins.nvim-spectre' end }
  use { 'weizheheng/nvim-workbench', config = function() require'plugins.nvim-workbench' end }
  use { 'dkarter/bullets.vim', config = function() require'plugins.bullets' end }
  use { 'triglav/vim-visual-increment' }
  use { 'mg979/vim-visual-multi' }
  use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim", config = function() require'plugins.todo-comments' end }
  use { 's1n7ax/nvim-comment-frame', config = function() require'plugins.nvim-comment-frame' end }
  use { "chentoast/marks.nvim", config = function() require'plugins.marks' end }
  use { "AckslD/nvim-neoclip.lua", requires = {'tami5/sqlite.lua', module = 'sqlite'}, config = function() require'plugins.nvim-neoclip' end }
  use { "junegunn/vim-peekaboo" }
  use { "rcarriga/nvim-notify", config = function() require'plugins.nvim-notify' end }
  use { "nvim-neotest/neotest", requires = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "antoinemadec/FixCursorHold.nvim" } }
  use { "danymat/neogen", requires = "nvim-treesitter/nvim-treesitter", config = function() require'plugins.neogen' end }
  use { "ThePrimeagen/refactoring.nvim", requires = {{"nvim-lua/plenary.nvim"}, {"nvim-treesitter/nvim-treesitter"}}, config = function() require'plugins.refactoring' end }
  use { "Julian/vim-textobj-variable-segment", requires = {"kana/vim-textobj-user"} }
  use { "kana/vim-textobj-entire", requires = {"kana/vim-textobj-user"} }
  use { "kana/vim-textobj-indent", requires = {"kana/vim-textobj-user"} }
  use { 'ggandor/lightspeed.nvim', config = function() require'plugins.lightspeed' end }
  use { 'akinsho/toggleterm.nvim', config = function() require'plugins.toggleterm' end }
  use { "Badhi/nvim-treesitter-cpp-tools", ft = {'cpp'}, requires = {{"nvim-treesitter/nvim-treesitter"}}, config = function() require'plugins.nvim-treesitter-cpp-tools' end }
  use { 'ray-x/go.nvim', ft = {'go'}, config = function() require'plugins.go' end }
  use { "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig", config = function() require'plugins.navic' end }
  use { "axieax/urlview.nvim" }
  use { 'ekickx/clipboard-image.nvim' }
  use { 'j-hui/fidget.nvim', config = function() require'plugins.fidget' end }
  use { 'echasnovski/mini.nvim' }
  use { "Pocco81/HighStr.nvim", config = function() require'plugins.highstr' end }
  use { 'sindrets/winshift.nvim', config = function() require'plugins.winshift' end }
  use { "askfiy/nvim-picgo", config = function() require'plugins.picgo' end }
  use { 'Shatur/neovim-session-manager', config = function() require'plugins.neovim-session-manager' end }
  use { 'lewis6991/satellite.nvim', config = function() require'plugins.satellite' end }
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async', config = function() require'plugins.nvim-ufo' end }
  use { "folke/noice.nvim", event = "VimEnter", config = function() require("noice").setup() end, requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify", } }

  -- lua dev
  use { "rafcamlet/nvim-luapad", ft = {'lua'} }
  use { "nanotee/luv-vimdocs" }

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
      { "hrsh7th/cmp-cmdline", config = function() require('plugins.cmp-cmdline') end },
      { 'uga-rosa/cmp-dictionary' },
      -- { "tzachar/cmp-tabnine", run = "./install.sh", config = function() require'plugins.cmp-tabnine' end },
      { "kdheepak/cmp-latex-symbols" },
    },
    config = function() require('plugins.nvim-cmp') end
  }
  use { "github/copilot.vim", requires = {'hrsh7th/nvim-cmp'}, config = function() require('plugins.copilot') end }
  use { 'hrsh7th/vim-vsnip', requires = {'hrsh7th/nvim-cmp'}, config = function() require('plugins.vim-vsnip') end }
  use { "rafamadriz/friendly-snippets" }
  use { 'stevearc/aerial.nvim', config = function() require('plugins.aerial') end }

  -- lsp
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/nvim-lsp-installer' }
  use { 'onsails/lspkind-nvim' }
  use { 'ray-x/lsp_signature.nvim' }
  use { 'RRethy/vim-illuminate' }
  use { "folke/neodev.nvim" }
  use { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" }, config = function() require'plugins.null-ls' end }

  -- themes
  use { 'olimorris/onedarkpro.nvim' }
  use { 'EdenEast/nightfox.nvim' }
  use { 'monsonjeremy/onedark.nvim' }
  use { "lifepillar/vim-gruvbox8" }
  use { "projekt0n/github-nvim-theme" }
  use { 'folke/tokyonight.nvim' }
  use { 'rainbowhxch/nvim-deus' }
  use { 'mhdahmad/gruvbox.lua' }
  use { 'rebelot/kanagawa.nvim' }
  use { 'luisiacc/gruvbox-baby' }
  use { 'tanvirtin/monokai.nvim' }

  if PackerBootstrap then
    require('packer').sync()
  end
end)
