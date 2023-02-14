local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- decoration
  { 'windwp/nvim-autopairs', config = function() require('plugins.nvim-autopairs') end },
  { 'lukas-reineke/indent-blankline.nvim', config = function() require('plugins.indent-blankline') end },
  { 'goolord/alpha-nvim', dependencies = { 'kyazdani42/nvim-web-devicons' }, config = function() require('plugins.alpha-nvim') end },
  { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons'}, config = function() require('plugins.lualine') end },
  { 'romgrk/barbar.nvim', dependencies = {'kyazdani42/nvim-web-devicons'}, config = function() require('plugins.barbar') end },
  { 'aklt/plantuml-syntax' },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', config = function() require('plugins.nvim-treesitter') end },
  { 'mrjones2014/nvim-ts-rainbow', dependencies = {'nvim-treesitter/nvim-treesitter'}, config = function() require('plugins.nvim-ts-rainbow') end },
  { 'windwp/nvim-ts-autotag', dependencies = {'nvim-treesitter/nvim-treesitter'}, config = function() require('plugins.nvim-ts-autotag') end },
  { 'JoosepAlviste/nvim-ts-context-commentstring', dependencies = {'nvim-treesitter/nvim-treesitter'}, config = function() require('plugins.nvim-ts-context-commentstring') end },
  { 'nvim-treesitter/nvim-treesitter-textobjects', dependencies = {'nvim-treesitter/nvim-treesitter'}, config = function() require('plugins.nvim-treesitter-textobjects') end },
  { 'RRethy/nvim-treesitter-endwise', dependencies = {'nvim-treesitter/nvim-treesitter'}, config = function() require('plugins.nvim-treesitter-endwise') end },
  { 'lewis6991/nvim-treesitter-context', dependencies = {'nvim-treesitter/nvim-treesitter'}, config = function() require('plugins.nvim-treesitter-context') end },
  { 'NvChad/nvim-colorizer.lua', config = function() require('plugins.nvim-colorizer') end },
  { 'wfxr/minimap.vim', cmd = {'MinimapToggle'} },
  { 'karb94/neoscroll.nvim', config = function() require('plugins.neoscroll') end },
  { 'kevinhwang91/nvim-hlslens', config = function() require('plugins.nvim-hlslens') end },
  { 'lewis6991/gitsigns.nvim', dependencies = {'nvim-lua/plenary.nvim'}, config = function() require('plugins.gitsigns') end },
  { 'stevearc/dressing.nvim' },
  { 'rainbowhxch/beacon.nvim' },
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  { 'nvim-treesitter/playground', config = function() require('plugins.playground') end },

  -- reading mode
  { 'folke/zen-mode.nvim', dependencies = {'folke/twilight.nvim'}, config = function() require('plugins.zen-mode') end },

  -- functional
  { 'nvim-telescope/telescope.nvim', dependencies = {{'nvim-lua/plenary.nvim'}}, config = function() require('plugins.nvim-telescope') end },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', config = function() require('plugins.telescope-fzf-native') end },
  { 'nvim-telescope/telescope-symbols.nvim', dependencies = {{'nvim-telescope/telescope.nvim'}} },
  { 'iamcco/markdown-preview.nvim', ft = {'markdown'}, build = 'cd app && yarn install', cmd = 'MarkdownPreview', config = function() require('plugins.markdown-preview') end },
  { 'mzlogin/vim-markdown-toc', ft = {'markdown'}, cmd = {'GenTocGFM'}, config = function() require('plugins.vim-markdown-toc') end },
  { 'dhruvasagar/vim-table-mode', ft = {'markdown'}, config = function() require('plugins.vim-table-mode') end },
  { 'lervag/vimtex', ft = {'tex'}, config = function() require('plugins.vimtex') end },
  { 'junegunn/vim-easy-align', config = function() require('plugins.vim-easy-align') end },
  { 'MattesGroeger/vim-bookmarks', config = function() require('plugins.vim-bookmarks') end },
  { 'lambdalisue/suda.vim', config = function() require('plugins.suda') end },
  { 'terrortylor/nvim-comment', config = function() require'plugins.nvim-comment' end },
  { 'kyazdani42/nvim-tree.lua', dependencies = { 'kyazdani42/nvim-web-devicons', }, config = function() require'plugins.nvim-tree' end},
  { 'drmikehenry/vim-headerguard', ft = {'c', 'cpp'}, cmd = {'HeaderguardAdd'}, config = function() require('plugins.vim-headerguard') end },
  { 'mbbill/undotree', cmd = {'UndotreeToggle'}, config = function() require('plugins.undotree') end },
  { 'rainbowhxch/accelerated-jk.nvim', config = function() require('plugins.accelerated-jk') end },
  { 'metakirby5/codi.vim' },
  { 'mfussenegger/nvim-dap', config = function() require'plugins.nvim-dap' end },
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"} },
  { 'theHamsta/nvim-dap-virtual-text', dependencies = {'mfussenegger/nvim-dap'}, config = function() require'plugins.nvim-dap-virtual-text' end },
  { 'folke/trouble.nvim', config = function() require'plugins.trouble' end },
  { 'alpertuna/vim-header', ft = {'cpp'}, config = function() require'plugins.vim-header' end },
  { 'windwp/nvim-spectre', config = function() require'plugins.nvim-spectre' end },
  { 'weizheheng/nvim-workbench', config = function() require'plugins.nvim-workbench' end },
  { 'dkarter/bullets.vim', config = function() require'plugins.bullets' end },
  { 'triglav/vim-visual-increment' },
  { 'mg979/vim-visual-multi' },
  { "folke/todo-comments.nvim", dependencies = "nvim-lua/plenary.nvim", config = function() require'plugins.todo-comments' end },
  { 's1n7ax/nvim-comment-frame', config = function() require'plugins.nvim-comment-frame' end },
  { "chentoast/marks.nvim", config = function() require'plugins.marks' end },
  { "AckslD/nvim-neoclip.lua", dependencies = {'tami5/sqlite.lua', module = 'sqlite'}, config = function() require'plugins.nvim-neoclip' end },
  { "junegunn/vim-peekaboo" },
  { "nvim-neotest/neotest", dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "antoinemadec/FixCursorHold.nvim" } },
  { "danymat/neogen", dependencies = "nvim-treesitter/nvim-treesitter", config = function() require'plugins.neogen' end },
  { "ThePrimeagen/refactoring.nvim", dependencies = {{"nvim-lua/plenary.nvim"}, {"nvim-treesitter/nvim-treesitter"}}, config = function() require'plugins.refactoring' end },
  { "Julian/vim-textobj-variable-segment", dependencies = {"kana/vim-textobj-user"} },
  { "kana/vim-textobj-entire", dependencies = {"kana/vim-textobj-user"} },
  { "kana/vim-textobj-indent", dependencies = {"kana/vim-textobj-user"} },
  { 'ggandor/leap.nvim', config = function() require'plugins.leap' end },
  { 'ggandor/flit.nvim', config = function() require'plugins.flit' end },
  { 'akinsho/toggleterm.nvim', config = function() require'plugins.toggleterm' end },
  { "Badhi/nvim-treesitter-cpp-tools", ft = {'cpp'}, dependencies = {{"nvim-treesitter/nvim-treesitter"}}, config = function() require'plugins.nvim-treesitter-cpp-tools' end },
  { 'ray-x/go.nvim', ft = {'go'}, config = function() require'plugins.go' end },
  { "axieax/urlview.nvim" },
  { 'ekickx/clipboard-image.nvim' },
  { 'echasnovski/mini.nvim' },
  { "Pocco81/HighStr.nvim", config = function() require'plugins.highstr' end },
  { 'sindrets/winshift.nvim', config = function() require'plugins.winshift' end },
  { "askfiy/nvim-picgo", config = function() require'plugins.picgo' end },
  { 'Shatur/neovim-session-manager', config = function() require'plugins.neovim-session-manager' end },
  { 'lewis6991/satellite.nvim', config = function() require'plugins.satellite' end },
  {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async', config = function() require'plugins.nvim-ufo' end },
  { "folke/noice.nvim", event = "VimEnter", config = function() require'plugins.noice' end, dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify", } },
  { "utilyre/barbecue.nvim", dependencies = { "neovim/nvim-lspconfig", "smiteshp/nvim-navic", "kyazdani42/nvim-web-devicons" }, config = function() require("barbecue").setup() end },
  { 'smjonas/live-command.nvim', config = function() require'plugins.live-command' end },
  { "kylechui/nvim-surround", config = function() require("nvim-surround").setup({}) end },
  { "jackMort/ChatGPT.nvim", config = function() require("chatgpt").setup({}) end, dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" } },
  { "chrisgrieser/nvim-recorder", config = function() require"plugins.nvim-recorder" end,},

  -- lua dev
  { "folke/neodev.nvim" },
  { "rafcamlet/nvim-luapad", ft = {'lua'} },
  { "nanotee/luv-vimdocs" },

  -- autocompletor
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { 'saadparwaiz1/cmp_luasnip' },
      { "hrsh7th/cmp-emoji" },
      { "hrsh7th/cmp-cmdline", config = function() require('plugins.cmp-cmdline') end },
      { 'uga-rosa/cmp-dictionary' },
      { "kdheepak/cmp-latex-symbols" },
    },
    config = function() require('plugins.nvim-cmp') end
  },
  {"L3MON4D3/LuaSnip", config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = {"./snippets" } })
  end },
  { "rafamadriz/friendly-snippets" },

  -- lsp
  { 'neovim/nvim-lspconfig' },
  { 'onsails/lspkind-nvim' },
  { 'ray-x/lsp_signature.nvim' },
  { 'RRethy/vim-illuminate' },
  { "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = function() require'plugins.null-ls' end },
  { 'simrat39/rust-tools.nvim' },
  { 'stevearc/aerial.nvim', config = function() require('plugins.aerial') end },
  { 'williamboman/mason.nvim', config = function() require("mason").setup() end },
  { 'williamboman/mason-lspconfig.nvim', dependencies = { {"williamboman/mason.nvim"}, {'neovim/nvim-lspconfig'} }, config = function() require("mason-lspconfig").setup() end },
  { 'jay-babu/mason-null-ls.nvim', dependencies = { {"williamboman/mason.nvim"}, {'jose-elias-alvarez/null-ls.nvim'} }, config = function() require("mason-null-ls").setup() end },
  { 'jayp0521/mason-nvim-dap.nvim', dependencies = { {"williamboman/mason.nvim"}, {'mfussenegger/nvim-dap'} }, config = function() require("mason-nvim-dap").setup() end },

  -- themes
  { 'olimorris/onedarkpro.nvim' },
  { 'EdenEast/nightfox.nvim' },
  { 'monsonjeremy/onedark.nvim' },
  { "lifepillar/vim-gruvbox8" },
  { "projekt0n/github-nvim-theme" },
  { 'folke/tokyonight.nvim' },
  { 'rainbowhxch/nvim-deus' },
  { 'mhdahmad/gruvbox.lua' },
  { 'rebelot/kanagawa.nvim' },
  { 'luisiacc/gruvbox-baby' },
  { 'tanvirtin/monokai.nvim' },
  { 'sainnhe/gruvbox-material' },
  { "arturgoms/moonbow.nvim" },
})