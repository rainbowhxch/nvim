" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/ch/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/ch/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/ch/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/ch/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ch/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["accelerated-jk"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/accelerated-jk"
  },
  ["any-jump.vim"] = {
    commands = { "AnyJump" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ch/.local/share/nvim/site/pack/packer/opt/any-jump.vim"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/asynctasks.vim"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["codi.vim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/codi.vim"
  },
  ["context.vim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/context.vim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["dial.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/dial.nvim"
  },
  ["echodoc.vim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/echodoc.vim"
  },
  ["far.vim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/far.vim"
  },
  firenvim = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/firenvim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    commands = { "Goyo" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ch/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["limelight.vim"] = {
    commands = { "Goyo" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ch/.local/share/nvim/site/pack/packer/opt/limelight.vim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ch/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["minimap.vim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/minimap.vim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-hlslens"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plantuml-syntax"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/plantuml-syntax"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  sniprun = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/sniprun"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["suda.vim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/suda.vim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ch/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-bookmarks"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-bookmarks"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-headerguard"] = {
    commands = { "HeaderguardAdd" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ch/.local/share/nvim/site/pack/packer/opt/vim-headerguard"
  },
  ["vim-markdown-toc"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-peekaboo"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-table-mode"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/opt/vim-table-mode"
  },
  ["vim-which-key"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-which-key"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/opt/vimtex"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vista.vim"
  }
}


-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Goyo lua require("packer.load")({'goyo.vim', 'limelight.vim'}, { cmd = "Goyo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file HeaderguardAdd lua require("packer.load")({'vim-headerguard'}, { cmd = "HeaderguardAdd", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file AnyJump lua require("packer.load")({'any-jump.vim'}, { cmd = "AnyJump", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'vim-headerguard'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'vim-headerguard'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-markdown-toc', 'markdown-preview.nvim', 'vim-table-mode'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
vim.cmd [[source /home/ch/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]]
vim.cmd [[source /home/ch/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
