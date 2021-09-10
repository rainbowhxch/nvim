-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/ch/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/ch/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/ch/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/ch/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ch/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
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
  ["asyncrun.extra"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/asyncrun.extra"
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
  ["beacon.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/beacon.nvim"
  },
  ["bullets.vim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/bullets.vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/cmp-calc"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/cmp-emoji"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  ["cmp-tabnine"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/cmp-tabnine"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/cmp-vsnip"
  },
  ["codi.vim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/codi.vim"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim"
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
  ["formatter.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/gruvbox.nvim"
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
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/limelight.vim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/lush.nvim"
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
  ["neoscroll.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-comment-frame"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-comment-frame"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-hlslens"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lsputils"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-lsputils"
  },
  ["nvim-reload"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-reload"
  },
  ["nvim-spectre"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
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
  ["nvim-workbench"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim-workbench"
  },
  nvim_context_vt = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/nvim_context_vt"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/onedark.nvim"
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
  popfix = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  rnvimr = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/rnvimr"
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
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
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
  ["vim-deus"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-deus"
  },
  ["vim-doge"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-doge"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-header"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-header"
  },
  ["vim-headerguard"] = {
    commands = { "HeaderguardAdd" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ch/.local/share/nvim/site/pack/packer/opt/vim-headerguard"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-indent-object"
  },
  ["vim-markdown-toc"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc"
  },
  ["vim-matchup"] = {
    after_files = { "/home/ch/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-signature"
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
  ["vim-visual-increment"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-visual-increment"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/opt/vimtex"
  },
  ["zen-mode.nvim"] = {
    loaded = true,
    path = "/home/ch/.local/share/nvim/site/pack/packer/start/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AnyJump lua require("packer.load")({'any-jump.vim'}, { cmd = "AnyJump", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HeaderguardAdd lua require("packer.load")({'vim-headerguard'}, { cmd = "HeaderguardAdd", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'vim-headerguard'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'vim-headerguard'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-table-mode', 'vim-markdown-toc', 'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'vim-matchup'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/ch/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /home/ch/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /home/ch/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /home/ch/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/ch/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/ch/.local/share/nvim/site/pack/packer/opt/vim-markdown-toc/ftdetect/markdown.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
