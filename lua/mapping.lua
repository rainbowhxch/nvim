local function map(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, { silent = true })
end

local function noremap(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

local function nmap(lhs, rhs)
	map('n', lhs, rhs)
end

local function imap(lhs, rhs)
	map('i', lhs, rhs)
end

local function cmap(lhs, rhs)
	map('c', lhs, rhs)
end

local function vmap(lhs, rhs)
	map('v', lhs, rhs)
end

local function xmap(lhs, rhs)
	map('x', lhs, rhs)
end

local function omap(lhs, rhs)
	map('o', lhs, rhs)
end

local function tmap(lhs, rhs)
	map('t', lhs, rhs)
end

local function nnoremap(lhs, rhs)
    noremap('n', lhs, rhs)
end

local function inoremap(lhs, rhs)
    noremap('i', lhs, rhs)
end

local function cnoremap(lhs, rhs)
    noremap('c', lhs, rhs)
end

local function vnoremap(lhs, rhs)
    noremap('v', lhs, rhs)
end

local function xnoremap(lhs, rhs)
    noremap('x', lhs, rhs)
end

local function onoremap(lhs, rhs)
    noremap('o', lhs, rhs)
end

local function tnoremap(lhs, rhs)
    noremap('t', lhs, rhs)
end

-- Open the vimrc file
noremap('<LEADER>rc', '<CMD>edit $MYVIMRC<CR>')

-- Shut down the hightlight of last search
noremap('<LEADER><CR>', '<CMD>nohlsearch')

-- Move cursor to other window
nnoremap('<LEADER>l', '<C-w>l')
nnoremap('<LEADER>h', '<C-w>h')
nnoremap('<LEADER>j', '<C-w>j')
nnoremap('<LEADER>k', '<C-w>k')
-- Move current window to other positions
nnoremap('<LEADER>L', '<C-w>L')
nnoremap('<LEADER>H', '<C-w>H')
nnoremap('<LEADER>J', '<C-w>J')
nnoremap('<LEADER>K', '<C-w>K')

-- Substitute
noremap('<LEADER>s', '<CMD>%s///g<LEFT><LEFT><LEFT>')

-- Switch upper or lower
noremap('<LEADER>u', '~h')

-- Figlet font --
noremap('<LEADER>fr', '<CMD>r !figlet<SPACE>')

-- Alter the keymap between colemak with normal us keyboard
noremap('<LEADER>bc', '<CMD>source %HOME/.config/nvim/insert-colemak.vim<CR>')
noremap('<LEADER>bu', '<CMD>source %HOME/.config/nvim/insert-normal.vim<CR>')

-- Plus 1 to value of current digit
nnoremap('<LEADER>.', '<C-a>')
-- Minus 1 to value of current digit
nnoremap('<LEADER>,', '<C-x>')

-- Jump to the next placehold and edit it
nnoremap('<LEADER><LEADER>', '<ESC>/<++><CR><CMD>nohlsearch<CR>c4l')

-- Go next or previous searched text and keep in middle of screen
noremap('-', 'Nzz')
noremap('=', 'nzz')

-- Change indent
nnoremap('<', '<<')
nnoremap('>', '>>')
xnoremap('<', '<gv')
xnoremap('>', '>gv')

-- Use accelerated-jk for normal up/down movement
nmap('j', '<Plug>(accelerated_jk_gj)')
nmap('k', '<Plug>(accelerated_jk_gk)')
noremap('J', '5j')
noremap('k', '5k')
-- Move current line up
nnoremap('<C-k>', '<CMD><C-u>move -2<CR>')
xnoremap('<C-k>', '<CMD>move -2<CR>gv')
-- Move current line down
nnoremap('<C-j>', '<CMD><C-u>move +1<CR>')
xnoremap('<C-j>', "<CMD>move '>+1<CR>gv")
-- Move cusor to head of current line
noremap('<C-h>', '^')
-- Move cusor to end of current line
nnoremap('<C-l>', '$')
xnoremap('<C-l>', 'g_')

-- <C-u> go to older position, <C-o> go to newer position
nnoremap('<C-o>', '<C-i>')
nnoremap('<C-u>', '<C-o>')

-- Use sys-clipboard
nnoremap('<C-y>', '"+yy')
nnoremap('<C-p>', 'o<ESC>"+p')
xnoremap('<C-y>', '"+y')
xnoremap('<C-p>', '"+p')

-- Command mode movement
cnoremap('<C-a>', '<HOME>')
cnoremap('<C-e>', '<END>')
cnoremap('<C-h>', '<LEFT>')
cnoremap('<C-l>', '<RIGHT>')

-- Save
nnoremap('S', '<CMD>w<CR>')

-- Quit
nnoremap('Q', '<CMD>q>CR>')

-- Refresh my vimrc
nnoremap('R', '<CMD>source $MYVIMRC<CR>')

-- Split windows
nnoremap('s', '<NOP>')
nnoremap('sl', '<CMD>set splitright<CR><CMD>vsplit<CR>')
nnoremap('sh', '<CMD>set nosplitright<CR><CMD>vsplit<CR>')
nnoremap('sk', '<CMD>set splitbelow<CR><CMD>split<CR>')
nnoremap('sj', '<CMD>set nosplitbelow<CR><CMD>split<CR>')

-- Change size of the current window
nnoremap('<UP>', '<CMD>resize +5<CR>')
nnoremap('<DOWN>', '<CMD>resize -5<CR>')
nnoremap('<LEFT>', '<CMD>vertical resize+5<CR>')
nnoremap('<RIGHT>', '<CMD>vertical resize-5<CR>')

-- Tab operation
nnoremap('<LEADER>te', '<CMD>tabedit<CR>')
nnoremap('[t', '<CMD>-tabnext<CR>')
nnoremap(']t', '<CMD>+tabnext<CR>')
nnoremap('<LEADER>tk', '<CMD>-tabmove<CR>')
nnoremap('<LEADER>tj', '<CMD>+tabmove<CR>')

-- Make terminal exiting easy
tnoremap('<ESC>', '<C-\\><C-n>')
