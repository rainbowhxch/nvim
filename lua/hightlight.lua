local function highlight(group, style)
    vim.cmd('highlight ' .. group .. ' ' .. style)
end

local function load_highlights()
    local highlights = {
        -- Normal                  = 'guibg=NONE ctermbg=NONE';
        -- SignColumn              = 'guibg=NONE ctermbg=NONE';
        -- CocGitAddedSign         = 'ctermfg=142 guifg=#b8bb26 guibg=#242a32 ctermbg=NONE';
        -- CocGitChangedSign       = 'ctermfg=108 guifg=#8ec07c guibg=#242a32 ctermbg=NONE';
        -- CocGitRemovedSign       = 'ctermfg=167 guifg=#fb4934 guibg=#242a32 ctermbg=NONE';
        -- CocGitTopRemovedSign    = 'ctermfg=167 guifg=#fb4934 guibg=#242a32 ctermbg=NONE';
        -- CocGitChangeRemovedSign = 'ctermfg=167 guifg=#fb4934 guibg=#242a32 ctermbg=NONE';
        -- SignatureMarkText       = 'ctermfg=109 guifg=#83a598 guibg=#242a32 ctermbg=NONE';
        -- CocHighlightText        = 'ctermfg=142 gui=underline,italic guifg= guibg= ctermbg=NONE';
    }
    for group, style in pairs(highlights) do
        highlight(group, style)
    end
end

load_highlights();
