local utils = require('utils')

-- Open the vimrc file
utils.nnoremap('<LEADER>rc', '<CMD>edit $MYVIMRC<CR>')

-- Shut down the hightlight of last search
utils.nnoremap('<LEADER><CR>', '<CMD>nohlsearch<CR>')

-- Move cursor to other window
utils.nnoremap('<LEADER>l', '<C-w>l')
utils.nnoremap('<LEADER>h', '<C-w>h')
utils.nnoremap('<LEADER>j', '<C-w>j')
utils.nnoremap('<LEADER>k', '<C-w>k')
-- Move current window to other positions
utils.nnoremap('<LEADER>L', '<C-w>L')
utils.nnoremap('<LEADER>H', '<C-w>H')
utils.nnoremap('<LEADER>J', '<C-w>J')
utils.nnoremap('<LEADER>K', '<C-w>K')

-- Substitute
utils.nnoremap('<LEADER>s', ':%s///g<LEFT><LEFT><LEFT>')
utils.vnoremap('<LEADER>s', ':s///g<LEFT><LEFT><LEFT>')

-- Switch upper or lower
utils.nnoremap('<LEADER>u', '~h')
utils.vnoremap('<LEADER>u', '~h')

-- Figlet font --
utils.nnoremap('<LEADER>fr', '<CMD>r !figlet<SPACE>')

-- Alter the keymap between colemak with normal us keyboard
utils.nnoremap('<LEADER>bc', '<CMD>source %HOME/.config/nvim/insert-colemak.vim<CR>')
utils.nnoremap('<LEADER>bu', '<CMD>source %HOME/.config/nvim/insert-normal.vim<CR>')

-- Jump to the next placehold and edit it
utils.nnoremap('<LEADER><LEADER>', '<ESC>/<++><CR><CMD>nohlsearch<CR>c4l')

-- Go next or previous searched text and keep in middle of screen
utils.nnoremap('-', 'Nzz')
utils.nnoremap('=', 'nzz')

-- Change indent
utils.nnoremap('<', '<<')
utils.nnoremap('>', '>>')
utils.xnoremap('<', '<gv')
utils.xnoremap('>', '>gv')

-- More lines movement
utils.nnoremap('J', '5j')
utils.xnoremap('J', '5j')
utils.nnoremap('K', '5k')
utils.xnoremap('K', '5k')
-- Move current line up
utils.nnoremap('<C-k>', '<CMD><C-u>move -2<CR>')
utils.xnoremap('<C-k>', '<CMD>move -2<CR>gv')
-- Move current line down
utils.nnoremap('<C-j>', '<CMD><C-u>move +1<CR>')
utils.xnoremap('<C-j>', "<CMD>move '>+1<CR>gv")
-- Move cusor to head of current line
utils.nnoremap('<C-h>', '^')
utils.xnoremap('<C-h>', '^')
-- Move cusor to end of current line
utils.nnoremap('<C-l>', '$')
utils.xnoremap('<C-l>', 'g_')

-- <C-u> go to older position, <C-o> go to newer position
-- utils.nnoremap('<C-o>', '<C-i>')
-- utils.nnoremap('<C-u>', '<C-o>')

-- Use sys-clipboard
utils.nnoremap('<C-y>', '"+yy')
utils.nnoremap('<C-p>', 'o<ESC>"+p')
utils.xnoremap('<C-y>', '"+y')
utils.xnoremap('<C-p>', '"+p')

-- Command mode movement
utils.cnoremap('<C-a>', '<HOME>')
utils.cnoremap('<C-e>', '<END>')
utils.cnoremap('<C-h>', '<LEFT>')
utils.cnoremap('<C-l>', '<RIGHT>')

-- Save
utils.nnoremap('S', '<CMD>w<CR>')

-- Quit
utils.nnoremap('Q', '<CMD>q<CR>')

-- Split windows
utils.nnoremap('s', '<NOP>')
utils.nnoremap('sl', '<CMD>set splitright<CR><CMD>vsplit<CR>')
utils.nnoremap('sh', '<CMD>set nosplitright<CR><CMD>vsplit<CR>')
utils.nnoremap('sk', '<CMD>set splitbelow<CR><CMD>split<CR>')
utils.nnoremap('sj', '<CMD>set nosplitbelow<CR><CMD>split<CR>')

-- Change size of the current window
utils.nnoremap('<UP>', '<CMD>resize +5<CR>')
utils.nnoremap('<DOWN>', '<CMD>resize -5<CR>')
utils.nnoremap('<LEFT>', '<CMD>vertical resize+5<CR>')
utils.nnoremap('<RIGHT>', '<CMD>vertical resize-5<CR>')

-- Buffer operation
-- Go to the buffer that you view just before
utils.nnoremap('L', '<C-^>')

-- Tab operation
utils.nnoremap('<LEADER>te', '<CMD>tabedit<CR>')
utils.nnoremap('[t', '<CMD>-tabnext<CR>')
utils.nnoremap(']t', '<CMD>+tabnext<CR>')
utils.nnoremap('<LEADER>tk', '<CMD>-tabmove<CR>')
utils.nnoremap('<LEADER>tj', '<CMD>+tabmove<CR>')

-- Make terminal exiting easy
utils.tnoremap('<ESC>', '<C-\\><C-n>')

-- Run file
utils.nnoremap('<F7>', '<CMD>lua require(\'utils\').file_run()<CR>')

-- goto url
utils.nnoremap('gx', '<CMD>!xdg-open <cfile><CR>')
