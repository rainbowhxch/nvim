local function highlight(group, style)
  vim.cmd('highlight ' .. group .. ' ' .. style)
end

local function load_highlights()
  local highlights = {
    -- Normal                  = 'guibg=NONE ctermbg=NONE';
    -- SignColumn              = 'guibg=NONE ctermbg=NONE';
    -- SignatureMarkText       = 'ctermfg=109 guifg=#83a598 guibg=#242a32 ctermbg=NONE';
    LspDiagnosticsSignError       = 'guifg=#cc241d guibg=#3c3836';
    LspDiagnosticsSignWarning     = 'guifg=#d79921 guibg=#3c3836';
    LspDiagnosticsSignHint        = 'guifg=#98971a guibg=#3c3836';
    LspDiagnosticsSignInformation = 'guifg=#458588 guibg=#3c3836';
    DapBreakpointHL                 = 'guifg=#b15286 guibg=#3c3836';
    DapLogPointHL                   = 'guifg=#689d6a guibg=#3c3836';
    DapStoppedHL                    = 'guifg=#a89984 guibg=#3c3836';
  }
  for group, style in pairs(highlights) do
    highlight(group, style)
  end
end

load_highlights()
