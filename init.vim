"  __  __       _   _       _
" |  \/  |_   _| \ | |_   _(_)_ __ ___  _ __ ___
" | |\/| | | | |  \| \ \ / / | '_ ` _ \| '__/ __|
" | |  | | |_| | |\  |\ V /| | | | | | | | | (__
" |_|  |_|\__, |_| \_| \_/ |_|_| |_| |_|_|  \___|
"         |___/
"       * Originated by Rainbow Chen *

"""""""""""""""""""""""""""""""
"    some initial commands    "
"""""""""""""""""""""""""""""""
" Auto load plugs for the first time uses
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let s:vim_cachedir = $HOME. "/.cache/nvim/"

"""""""""""""""""""""""""""
"    some vim settings    "
"""""""""""""""""""""""""""
" nocompatible mode
set nocompatible
" open filetype, plugin, indent
filetype plugin indent on
" syntax enable
syntax on

set encoding=utf-8
set title
set autoread
set autowrite
set number
set relativenumber
set cursorline
set wrap
set showcmd
set ruler
set wildmenu
set history=100
" for map timeout
set timeout
set timeoutlen=1500
" for keycode timeout
set nottimeout
set hlsearch
set incsearch
set ignorecase
set smartcase
set whichwrap=b,s
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=16
set autoindent
set smartindent
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
" disable textwidth auto wrap
set formatoptions=q
set laststatus=2
" set working directory to the current file
set updatetime=100
set updatecount=100
set autochdir
set indentexpr=
set lazyredraw
set virtualedit=block
set termguicolors
set noshowmode
" shutdown the error bell
set noerrorbells
set novisualbell
set vb t_vb=
" recommender render 256 colors
set t_Co=256
" for preview of the substitue
set inccommand=split
set tags=./.tags;,.tags

" swap file
let &directory = s:vim_cachedir. "swap"
" file backup
let &backupdir = s:vim_cachedir. "backup"
" undo file
let &undodir = s:vim_cachedir. "undo"
" view file
let &viewdir = s:vim_cachedir. "view"
" shada file
let &shadafile = s:vim_cachedir. "shada"

" file path of swap, backup, undo, view and vimtex&vista plugin files
for d in [ &directory, &backupdir, &undodir, &viewdir,
	 \ s:vim_cachedir."vimtex", s:vim_cachedir."vista" ]
    call mkdir(d, "p", 0700)
endfor

set backup
set backupext=.bak
set undofile
set shada='1000,f1,<500

" cursor shape in i mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" cursor shape in r mode
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" cursor shape in normal mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" let vim with terminal be better
let &t_ut = ''
let &t_TI = "\<Esc>[>4;2m"
let &t_TE = "\<Esc>[>4;m"

" go back the last line where you quit vim
autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
                  \ |   exe "normal! g`\"" | endif
" automatically deletes all trailing whitespace and newlines at end of file on save
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e

" leader map
let g:mapleader=" "

"""""""""""""""""""""""""""""""
"   something about plugins   "
"""""""""""""""""""""""""""""""
" make task run on floaterm
function! s:run_floaterm(opts)
  let curr_bufnr = floaterm#curr()
  if has_key(a:opts, 'silent') && a:opts.silent == 1
    FloatermHide!
  endif
  let cmd = 'cd ' . shellescape(getcwd())
  call floaterm#terminal#send(curr_bufnr, [cmd])
  call floaterm#terminal#send(curr_bufnr, [a:opts.cmd])
  " Back to the normal mode
  stopinsert
endfunction

let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
let g:asyncrun_runner.floaterm = function('s:run_floaterm')
let g:asynctasks_term_pos = 'floaterm'

" Compile function
func! FileRun()
    exec "w"
    if &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'tex'
        silent! exec "VimtexStop"
        silent! exec "VimtexCompile"
    else
        set splitbelow
        exec "AsyncTask file-run"
    endif
endfunc
" Standard plugins -- for gdb
packadd termdebug

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'

Plug 'kyazdani42/nvim-web-devicons'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'terryma/vim-multiple-cursors'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'
Plug 'honza/vim-snippets'
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}
Plug 'mzlogin/vim-markdown-toc'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/vim-easy-align'
Plug 'liuchengxu/vista.vim'
Plug 'kshenoy/vim-signature'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/goyo.vim'
Plug 'lambdalisue/suda.vim'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'lervag/vimtex'
Plug 'voldikss/vim-floaterm'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'andymass/vim-matchup'
Plug 'tpope/vim-repeat'
Plug 'brooth/far.vim'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'pechorin/any-jump.vim'
Plug 'drmikehenry/vim-headerguard', { 'for': 'cpp' }
Plug 'mbbill/undotree'
Plug 'unblevable/quick-scope'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/echodoc.vim'
Plug 'glepnir/indent-guides.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'rhysd/accelerated-jk'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'mhartington/formatter.nvim'

" themes
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'connorholyday/vim-snazzy'
Plug 'arzg/vim-colors-xcode'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'nerdypepper/agila.vim'
Plug 'sainnhe/forest-night'
Plug 'mhartington/oceanic-next'
Plug 'rakr/vim-one'
Plug 'ajmwagar/vim-deus'

call plug#end()

" oceanic-next
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

" ayu
let ayucolor = "mirage"

" onedark
let g:onedark_terminal_italics = 1

" nord
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

" xcode
augroup vim-colors-xcode
    autocmd!
augroup END

autocmd vim-colors-xcode ColorScheme * hi Comment        cterm=italic gui=italic
autocmd vim-colors-xcode ColorScheme * hi SpecialComment cterm=italic gui=italic

" gruvbox
let g:gruvbox_italic = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_invert_signs = 1
let g:gruvbox_invert_indent_guides = 1
let g:gruvbox_invert_tabline = 1
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1

" forest
let g:forest_night_enable_italic = 1
let g:forest_night_disable_italic_comment = 1

" vim-one
let g:one_allow_italics = 1 " I love italic for comments
" quick-scope highlight
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#5fffff' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#ff99ff' gui=underline ctermfg=81 cterm=underline
augroup END

" vim colorscheme
colorscheme gruvbox

" auto-pairs
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutBackInsert = ''
let g:AutoPairsMapCh = 0
let g:AutoPairsShortcutFastWrap = '<C-a>'
let g:AutoPairsShortcutJump = '<C-;>'

" coc.nvim
let g:coc_global_extensions = [
    \ 'coc-emoji',
    \ 'coc-zi',
    \ 'coc-svg',
    \ 'coc-marketplace',
    \ 'coc-post',
    \ 'coc-lists',
    \ 'coc-bibtex',
    \ 'coc-picgo',
    \ 'coc-actions',
    \ 'coc-tasks',
    \ 'coc-git',
    \ 'coc-snippets',
    \ 'coc-explorer',
    \ 'coc-floaterm',
    \ 'coc-highlight',
    \ 'coc-yank',
    \ 'coc-calc',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-xml',
    \ 'coc-yaml',
    \ 'coc-tsserver',
    \ 'coc-clangd',
    \ 'coc-cmake',
    \ 'coc-python',
    \ 'coc-vimlsp',
    \ 'coc-sh',
    \ 'coc-vimtex',
    \ 'coc-sql']
"" use <tab> for trigger completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-G>u\<CR>"
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" common operation
noremap <LEADER>cd :CocFzfList commands<CR>
nmap [d <Plug>(coc-diagnostic-prev)
nmap ]d <Plug>(coc-diagnostic-next)
nmap [r <Plug>(coc-range-select)
nmap ]r <Plug>(coc-range-select-backward)
nmap gd <Plug>(coc-definition)
nmap gD <Plug>(coc-declaration)
nmap gi <Plug>(coc-implementation)
nnoremap gt :stjump <C-R><C-W><CR>
nmap gT <Plug>(coc-type-definition)
nmap gl <Plug>(coc-references)
nmap gr <Plug>(coc-rename)
nmap gR <Plug>(coc-refactor)
nmap gL <Plug>(coc-openlink)
vmap gF <Plug>(coc-format-selected)
nmap gF <Plug>(coc-format-selected)
nmap gq <Plug>(coc-fix-current)
nmap ga <Plug>(coc-codeaction)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
nnoremap <silent> g; :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')
" coc-clangd
noremap gh :CocCommand clangd.switchSourceHeader<CR>
" coc-snippets
imap <C-j> <Plug>(coc-snippets-expand-jump)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'
function! s:edit_snippets()
    execute 'tabedit '. $HOME. '/.config/nvim/snippets/'. &filetype. '.snippets'
endfunction
noremap <silent> gs :call <SID>edit_snippets()<CR>
" coc-explorer
noremap <LEADER>n :CocCommand explorer<CR>
" coc-yank
nnoremap <silent> <LEADER>y  :CocFzfList yank<CR>
" coc-translator
nmap <LEADER>ts <Plug>(coc-translator-p)
vmap <LEADER>ts <Plug>(coc-translator-pv)
" coc-git
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" fzf&coc.nvim
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" rainbow
let g:rainbow_active = 1

" vim-surround
nmap <LEADER>" ysmW"
nmap <LEADER>' ysmW'
nmap <LEADER>( ysmW)
nmap <LEADER>{ ysmW{
nmap <LEADER>[ ysmW[
nmap <LEADER>/ ysmW*ysmW/f*a<SPACE><ESC>f*m<SPACE><ESC>b

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = 'g<C-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-s>'
let g:multi_cursor_quit_key            = '<ESC>'

" nerdcommenter
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
nmap <LEADER>ca <plug>NERDCommenterAppend
nmap <Leader>cc <plug>NERDCommenterToggle
vmap <Leader>cc <plug>NERDCommenterToggle
nmap <Leader>cm <plug>NERDCommenterMinimal
vmap <Leader>cm <plug>NERDCommenterMinimal

" markdown-preview.vim
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

" vim-fzf
noremap <LEADER>ff :Files<CR>
noremap <LEADER>fg :GFiles<CR>
noremap <LEADER>fb :Buffers<CR>
noremap <LEADER>fc :Colors<CR>
noremap <LEADER>fl :Lines<CR>
noremap <LEADER>ft :Tags<CR>
noremap <LEADER>fm :Marks<CR>
noremap <LEADER>fw :Rg<CR>
noremap <LEADER>fW :Windows<CR>
noremap <LEADER>fh :History<CR>
noremap <LEADER>fs :CocFzfList snippets<CR>
noremap <LEADER>fo :CocFzfList outline<CR>
noremap <LEADER>fM :Maps<CR>

" vimspector
nnoremap <F3> :VimspectorReset<CR>
nnoremap <F4> :call vimspector#Restart()<CR>
nnoremap <F5> :call vimspector#Continue()<CR>
nnoremap <F8> :call vimspector#AddFunctionBreakpoint('<cexpr>')<CR>
nnoremap <F9> :call vimspector#ToggleBreakpoint()<CR>
nnoremap <F10> :call vimspector#StepOver()<CR>
nnoremap <F11> :call vimspector#StepInto()<CR>
nnoremap <F12> :call vimspector#StepOut()<CR>
function! s:read_template_into_buffer(template)
    " has to be a function to avoid the extra space fzf#run insers otherwise
    execute '0r ~/.config/nvim/vimspector_json_templation/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
    \   'source': 'ls -1 ~/.config/nvim/vimspector_json_templation',
    \   'down': 20,
    \   'sink': function('<sid>read_template_into_buffer')
    \ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=🔸 texthl=Normal
sign define vimspectorBPDisabled text=🔹 texthl=Normal
sign define vimspectorPC text=🔴 texthl=SpellBad

" vim-markdown-toc
noremap <LEADER>tg :GenTocGFM<CR>
let g:vmt_auto_update_on_save = 1
let g:vmt_dont_insert_fence = 0
let g:vmt_cycle_list_item_markers = 1
let g:vmt_include_headings_before = 0
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

" vim-table-mode
let g:table_mode_corner = '|'

" vim-easy-align
nmap <LEADER>al <Plug>(EasyAlign)
xmap <LEADER>al <Plug>(EasyAlign)

" vista
noremap T :Vista!!<CR>
noremap <C-t> :Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
let g:vista_executive_for = {
  \ 'c': 'coc',
  \ 'cpp': 'coc',
  \ }

" formatter.nvim
lua <<EOF
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
EOF
noremap <LEADER>af :Format<CR>

" vim-signature
let g:SignatureMap = {
    \ 'Leader'             :  "m",
    \ 'PlaceNextMark'      :  "m,",
    \ 'ToggleMarkAtLine'   :  "m.",
    \ 'PurgeMarksAtLine'   :  "m-",
    \ 'DeleteMark'         :  "dm",
    \ 'PurgeMarks'         :  "m<SPACE>",
    \ 'PurgeMarkers'       :  "m<BS>",
    \ 'GotoNextLineAlpha'  :  "",
    \ 'GotoPrevLineAlpha'  :  "",
    \ 'GotoNextSpotAlpha'  :  "",
    \ 'GotoPrevSpotAlpha'  :  "",
    \ 'GotoNextLineByPos'  :  "",
    \ 'GotoPrevLineByPos'  :  "",
    \ 'GotoNextSpotByPos'  :  "",
    \ 'GotoPrevSpotByPos'  :  "",
    \ 'GotoNextMarker'     :  "]-",
    \ 'GotoPrevMarker'     :  "[-",
    \ 'GotoNextMarkerAny'  :  "",
    \ 'GotoPrevMarkerAny'  :  "",
    \ 'ListBufferMarks'    :  "m/",
    \ 'ListBufferMarkers'  :  "m?"
    \ }

" vim-easymotion
" Disable default mappings
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
"/f{char} to move to {char}
vmap sf <Plug>(easymotion-bd-f)
nmap sf <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
vmap sc <Plug>(easymotion-bd-f2)
nmap sc <Plug>(easymotion-overwin-f2)
" Move to line
vmap sL <Plug>(easymotion-bd-jk)
nmap sL <Plug>(easymotion-overwin-line)
" Move to word
vmap sw <Plug>(easymotion-bd-w)
nmap sw <Plug>(easymotion-overwin-w)

" Goyo
nnoremap <LEADER>gy :Goyo<CR>
let g:goyo_width = '80'
let g:goyo_height = '80%'

" suda.vim
nnoremap <LEADER>S :SudaWrite<CR>
let g:suda#prompt = '(. > .) password please: '
let g:suda_smart_edit = 1

" asynctasks.vim
let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project' ]

" vimtex
let g:vimtex_mappings_enabled = 0
let g:vimtex_cache_root = s:vim_cachedir. 'vimtex'
let g:tex_flavor = 'latex'
let g:vimtex_toc_enabled = 0
let g:vimtex_quickfix_autoclose_after_keystrokes = 1
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : 'build',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-pdf',
    \ 'pdflatex'         : '-pdf',
    \ 'dvipdfex'         : '-pdfdvi',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}
let g:vimtex_doc_handlers = ['MyHandler']
function! MyHandler(context)
    call vimtex#doc#make_selection(a:context)
    if !empty(a:context.selected)
        execute '!texdoc' a:context.selected '&'
    endif
    return 1
endfunction

" floaterm
let g:floaterm_keymap_toggle = '<F1>'

" vim-matchup
let g:matchup_mappings_enabled = 1
let g:matchup_text_obj_enabled = 0
let g:matchup_override_vimtex = 1
xmap a% <plug>(matchup-%)
xmap i% <plug>(matchup-%)

" vim-which-key
nnoremap <silent> <LEADER> :WhichKey '<SPACE>'<CR>

" far.vim
nnoremap ss :Farp<CR>
let g:far#default_mappings = 1
let g:far#enable_undo = 1
let g:far#mapping = {
	\ "exclude" : "",
	\ "include" : "",
	\ "toggle_exclude" : "",
	\ "exclude_all" : "",
	\ "include_all" : "",
	\ "toggle_exclude_all" : "",
	\ "expand" : "",
	\ "collapse" : "",
	\ "toggle_expand" : "",
	\ "expand_all" : "",
	\ "collapse_all" : "",
	\ "toggle_expand_all" : "",
	\ "stoggle_exclude" : "e",
	\ "stoggle_exclude_all" : "E",
	\ "jump_to_source" : "<CR>",
	\ "open_preview" : "p",
	\ "close_preview" : "P",
	\ "preview_scroll_up" : "<C-k>",
	\ "preview_scroll_down" : "<C-j>",
	\ "stoggle_expand" : "za",
	\ "stoggle_expand_all" : "zA",
	\ "replace_do" : "r",
	\ "replace_undo" : "u",
	\ "replace_undo_all" : "U",
	\ "quit" : "q"
	\ }

" any-jump.vim
let g:any_jump_disable_default_keybindings = 1
noremap gj :AnyJump<CR>

" vim-headerguard.vim
noremap <LEADER>ah :HeaderguardAdd<CR>

" undotree.vim
nnoremap <LEADER>U :UndotreeToggle<cr>
function g:Undotree_CustomMap()
    nmap <buffer> J <plug>UndotreeNextState
    nmap <buffer> K <plug>UndotreePreviousState
endfunc

" nvim-treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}
EOF

" vim-gutentags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_define_advanced_commands = 1
let g:gutentags_enabled = 0
augroup auto_gutentags
  au FileType c,cpp let g:gutentags_enabled=1
augroup end

" echodoc.vim
let g:echodoc_enable_at_startup = 1

" indent_guides.nvim
lua require('indent_guides').setup()

" dashboard-nvim
let g:dashboard_default_executive ='fzf'
let g:dashboard_custom_shortcut={
  \ 'new_file'           : 'SPC c n',
  \ 'find_file'          : 'SPC f f',
  \ 'book_marks'         : 'SPC f m',
  \ 'find_word'          : 'SPC f w',
  \ 'find_history'       : 'SPC f h',
  \ 'change_colorscheme' : 'SPC f c',
  \ 'last_session'       : 'SPC s l',
  \ }
let g:dashboard_custom_header = [
      \'     ⠀⠀⠀⠀⠀⠀⠀⡴⠞⠉⢉⣭⣿⣿⠿⣳⣤⠴⠖⠛⣛⣿⣿⡷⠖⣶⣤⡀⠀⠀⠀  ',
      \'   ⠀⠀⠀⠀⠀⠀⠀⣼⠁⢀⣶⢻⡟⠿⠋⣴⠿⢻⣧⡴⠟⠋⠿⠛⠠⠾⢛⣵⣿⠀⠀⠀⠀  ',
      \'   ⣼⣿⡿⢶⣄⠀⢀⡇⢀⡿⠁⠈⠀⠀⣀⣉⣀⠘⣿⠀⠀⣀⣀⠀⠀⠀⠛⡹⠋⠀⠀⠀⠀  ',
      \'   ⣭⣤⡈⢑⣼⣻⣿⣧⡌⠁⠀⢀⣴⠟⠋⠉⠉⠛⣿⣴⠟⠋⠙⠻⣦⡰⣞⠁⢀⣤⣦⣤⠀  ',
      \'   ⠀⠀⣰⢫⣾⠋⣽⠟⠑⠛⢠⡟⠁⠀⠀⠀⠀⠀⠈⢻⡄⠀⠀⠀⠘⣷⡈⠻⣍⠤⢤⣌⣀  ',
      \'   ⢀⡞⣡⡌⠁⠀⠀⠀⠀⢀⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀⠀⠸⣇⠀⢾⣷⢤⣬⣉  ',
      \'   ⡞⣼⣿⣤⣄⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿⠀⠸⣿⣇⠈⠻  ',
      \'   ⢰⣿⡿⢹⠃⠀⣠⠤⠶⣼⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿⠀⠀⣿⠛⡄⠀  ',
      \'   ⠈⠉⠁⠀⠀⠀⡟⡀⠀⠈⡗⠲⠶⠦⢤⣤⣤⣄⣀⣀⣸⣧⣤⣤⠤⠤⣿⣀⡀⠉⣼⡇⠀  ',
      \'   ⣿⣴⣴⡆⠀⠀⠻⣄⠀⠀⠡⠀⠀⠀⠈⠛⠋⠀⠀⠀⡈⠀⠻⠟⠀⢀⠋⠉⠙⢷⡿⡇⠀  ',
      \'   ⣻⡿⠏⠁⠀⠀⢠⡟⠀⠀⠀⠣⡀⠀⠀⠀⠀⠀⢀⣄⠀⠀⠀⠀⢀⠈⠀⢀⣀⡾⣴⠃⠀  ',
      \'   ⢿⠛⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⠈⠢⠄⣀⠠⠼⣁⠀⡱⠤⠤⠐⠁⠀⠀⣸⠋⢻⡟⠀⠀  ',
      \'   ⠈⢧⣀⣤⣶⡄⠘⣆⠀⠀⠀⠀⠀⠀⠀⢀⣤⠖⠛⠻⣄⠀⠀⠀⢀⣠⡾⠋⢀⡞⠀⠀⠀  ',
      \'   ⠀⠀⠻⣿⣿⡇⠀⠈⠓⢦⣤⣤⣤⡤⠞⠉⠀⠀⠀⠀⠈⠛⠒⠚⢩⡅⣠⡴⠋⠀⠀⠀⠀  ',
      \'   ⠀⠀⠀⠈⠻⢧⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣻⠿⠋⠀⠀⠀⠀⠀⠀  ',
      \'   ⠀⠀⠀⠀⠀⠀⠉⠓⠶⣤⣄⣀⡀⠀⠀⠀⠀⠀⢀⣀⣠⡴⠖⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀  ',
      \ ]
let g:dashboard_custom_footer = [ "Welcome to RainbowCh's Nvim!" ]
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
nmap <Leader>cs :<C-u>SessionSave<CR>
nmap <Leader>cl :<C-u>SessionLoad<CR>

" galaxyline.nvim
lua require('eviline')

" nvim-bufferline.lus
lua require'bufferline'.setup{}

" nvim-hlslens
noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
                \<Cmd>lua require('hlslens').start()<CR>
noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
                \<Cmd>lua require('hlslens').start()<CR>
noremap * *<Cmd>lua require('hlslens').start()<CR>
noremap # #<Cmd>lua require('hlslens').start()<CR>
noremap g* g*<Cmd>lua require('hlslens').start()<CR>
noremap g# g#<Cmd>lua require('hlslens').start()<CR>

" lazygit
noremap <LEADER>gi :FloatermNew lazygit<CR>
noremap <LEADER>R :FloatermNew ranger<CR>

"""""""""""""""""""""""""""""""""""""""""
"  some mappings about common operation "
"""""""""""""""""""""""""""""""""""""""""
" Open the vimrc file
noremap <LEADER>rc :edit $MYVIMRC<CR>
" shut dowm the highlight of last search
noremap <LEADER><CR> :nohlsearch<CR>
" move cursor to other window
noremap <LEADER>l <C-w>l
noremap <LEADER>k <C-w>k
noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
" swith the position of current window
noremap <LEADER>L <C-w>L
noremap <LEADER>K <C-w>K
noremap <LEADER>H <C-w>H
noremap <LEADER>J <C-w>J
" substitute
noremap <LEADER>s :%s///g<left><left><left>
" switch upper or lower
noremap <LEADER>u ~h
" cute font
noremap <LEADER>fr :r !figlet<SPACE>
" go to next buffer
noremap ]b :bnext<CR>
" go to previous buffer
noremap [b :bprevious<CR>
" go to the buffer that you view just before
noremap L <C-^>
" delete current buffer
noremap H :bdelete<CR>
" alter the keymap between colemak with normal us keyboard
noremap <LEADER>bc :source $HOME/.config/nvim/insert-colemak.vim<CR>
noremap <LEADER>bu :source $HOME/.config/nvim/insert-normal.vim<CR>
" plus 1 to value in current location
noremap <LEADER>. <C-a>
" minus 1 to value in current location
noremap <LEADER>, <C-x>
" jump to the next placehold and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" go next or previous searched text and keep in middle of screen
nnoremap - Nzz
nnoremap = nzz
" change indent
nnoremap < <<
nnoremap > >>
" use accelerated-jk for normal up/down movement
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
noremap J 5j
noremap K 5k

" move current line up
nnoremap <C-k> :<c-u>move -2<CR>
xnoremap <C-k> :move -2<CR>gv
" move current line down
nnoremap <C-j> :<c-u>move +1<CR>
xnoremap <C-j> :move '>+1<CR>gv
" move cusor to head of current line
noremap <C-h> ^
" move cusor to end of current line
noremap <C-l> $
" <C-u> go to older position, <C-o> go to newer position
noremap <C-o> <C-i>
noremap <C-u> <C-o>
" use sys-clipboard in normal mode
nnoremap <C-y> "+yy
nnoremap <C-p> o<Esc>"+p

" go the end of the current line but ignore the return char
xnoremap <C-l> g_
" use sys-clipboard in v mode
xnoremap <C-y> "+y
xnoremap <C-p> "+p

" command mode movement
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

" re-select view block after indent in v mode
xnoremap < <gv
xnoremap > >gv
" save
nnoremap S :w<CR>
nnoremap s <nop>
" quit
nnoremap Q :q<CR>
" refresh my vimrc
nnoremap R :source $MYVIMRC<CR>

" split windows
nnoremap sl :set splitright<CR>:vsplit<CR>
nnoremap sh :set nosplitright<CR>:vsplit<CR>
nnoremap sk :set nosplitbelow<CR>:split<CR>
nnoremap sj :set splitbelow<CR>:split<CR>

" alter size of the current window
noremap <up> :resize +5<CR>
noremap <down> :resize -5<CR>
noremap <left> :vertical resize+5<CR>
noremap <right> :vertical resize-5<CR>

" tab operation
nnoremap <LEADER>te :tabedit<CR>
nnoremap [t :-tabnext<CR>
nnoremap ]t :+tabnext<CR>
nnoremap <LEADER>tk :-tabmove<CR>
nnoremap <LEADER>tj :+tabmove<CR>

" make current window widest on left or top
nnoremap sv <C-w>H
nnoremap sh <C-w>K
" rotate windows
nnoremap sr <C-w>r
nnoremap sR <C-w>R
" terminal keymaps
tnoremap <Esc> <C-\><C-n>

" compile and run (file scope or project scope)
noremap <F6> :AsyncTask file-build<CR>
noremap <F7> :call FileRun()<CR>
noremap <LEADER><F6> :AsyncTask project-build<CR>
noremap <LEADER><F7> :AsyncTask project-run<CR>

"""""""""""""""""""""""""""""""
"  colors for some conditions "
"""""""""""""""""""""""""""""""
" highlight Normal guibg=NONE ctermbg=NONE
" highlight SignColumn guibg=NONE ctermbg=NONE
highlight CocGitAddedSign ctermfg=142 guifg=#b8bb26 guibg=#242a32 ctermbg=NONE
highlight CocGitChangedSign ctermfg=108 guifg=#8ec07c guibg=#242a32 ctermbg=NONE
highlight CocGitRemovedSign ctermfg=167 guifg=#fb4934 guibg=#242a32 ctermbg=NONE
highlight CocGitTopRemovedSign ctermfg=167 guifg=#fb4934 guibg=#242a32 ctermbg=NONE
highlight CocGitChangeRemovedSign ctermfg=167 guifg=#fb4934 guibg=#242a32 ctermbg=NONE
highlight SignatureMarkText ctermfg=109 guifg=#83a598 guibg=#242a32 ctermbg=NONE
highlight CocHighlightText ctermfg=142 gui=underline,italic guifg= guibg= ctermbg=NONE

" highlight FleetingFlashyFiretrucks guibg=#55dd77
" function! s:show_prev_next_line()
    " let curline_number = line(".")
    " let curline_number_prev = curline_number - 5
    " let curline_number_next = curline_number + 5
    " let pattern = '/\\%' . string(curline_number_prev) . 'l\\|\\%' . string(curline_number_next) . 'l/'
    " execute "match FleetingFlashyFiretrucks ". pattern
" endfunction
" autocmd CursorMoved,CursorMovedI * call s:show_prev_next_line()

"""""""""""""""""""""""""""""""
"    auto executed commands   "
"""""""""""""""""""""""""""""""
exec "nohlsearch"
"""""""""""""""""""""""""""""""""""""""""""""""
"    some config put here to avoid conflict   "
"""""""""""""""""""""""""""""""""""""""""""""""
