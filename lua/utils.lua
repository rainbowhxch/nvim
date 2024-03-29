local M = {}

function M.map(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, { silent = true })
end

function M.noremap(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

function M.nmap(lhs, rhs)
	M.map('n', lhs, rhs)
end

function M.imap(lhs, rhs)
	M.map('i', lhs, rhs)
end

function M.cmap(lhs, rhs)
	M.map('c', lhs, rhs)
end

function M.vmap(lhs, rhs)
	M.map('v', lhs, rhs)
end

function M.xmap(lhs, rhs)
	M.map('x', lhs, rhs)
end

function M.omap(lhs, rhs)
	M.map('o', lhs, rhs)
end

function M.tmap(lhs, rhs)
	M.map('t', lhs, rhs)
end

function M.nnoremap(lhs, rhs)
    M.noremap('n', lhs, rhs)
end

function M.inoremap(lhs, rhs)
    M.noremap('i', lhs, rhs)
end

function M.cnoremap(lhs, rhs)
    M.noremap('c', lhs, rhs)
end

function M.vnoremap(lhs, rhs)
    M.noremap('v', lhs, rhs)
end

function M.xnoremap(lhs, rhs)
    M.noremap('x', lhs, rhs)
end

function M.onoremap(lhs, rhs)
    M.noremap('o', lhs, rhs)
end

function M.tnoremap(lhs, rhs)
    M.noremap('t', lhs, rhs)
end
function M.file_run()
    vim.api.nvim_command('write')
    ft = vim.api.nvim_get_option('filetype')
    if ft == 'markdown' then
        vim.api.nvim_command('MarkdownPreview')
    elseif ft == 'tex' then
        vim.api.nvim_command('VimtexStop')
        vim.api.nvim_command('VimtexCompile')
    else
        vim.api.nvim_command('AsyncTask file-run')
    end
end

return M
