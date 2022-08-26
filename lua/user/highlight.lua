local function highlight(group, style)
  vim.api.nvim_set_hl(0, group, style)
end

local function load_highlights()
  local highlights = {
    -- Normal                               = 'bg=NONE ctermbg=NONE';
    -- SignColumn                           = 'bg=NONE ctermbg=NONE';
    -- CursorLine                           = 'bg=#504945 ctermbg=NONE';
    -- ColorColumn                          = 'bg=#504945 ctermbg=NONE';
    -- CursorLineNr                         = 'bg=NONE ctermbg=NONE';
    -- TabLineFill                          = 'bg=#504945 ctermbg=NONE';
    illuminatedWord = {
      underline = true;
    },
    LspDiagnosticsSignError = {
      fg = '#cc241d',
      bg = '#3c3836'
    };
    LspDiagnosticsSignWarning = {
      fg = '#d79921',
      bg = '#3c3836'
    };
    LspDiagnosticsSignHint = {
      fg = '#98971a',
      bg = '#3c3836'
    };
    LspDiagnosticsSignInformation = {
      fg = '#458588',
      bg = '#3c3836'
    };
    LspDiagnosticsVirtualTextError = {
      fg = '#cc241d',
      bg = '#3c3836'
    },
    LspDiagnosticsVirtualTextWarning = {
      fg = '#d79921',
      bg = '#3c3836'
    },
    LspDiagnosticsVirtualTextHint = {
      fg = '#98971a',
      bg = '#3c3836'
    },
    LspDiagnosticsVirtualTextInformation = {
      fg = '#458588',
      bg = '#3c3836'
    },
    LspDiagnosticsFloatingError = {
      fg = '#cc241d',
      bg = '#3c3836'
    },
    LspDiagnosticsFloatingWarning = {
      fg = '#d79921',
      bg = '#3c3836'
    },
    LspDiagnosticsFloatingHint = {
      fg = '#98971a',
      bg = '#3c3836'
    },
    LspDiagnosticsFloatingInformation = {
      fg = '#458588',
      bg = '#3c3836'
    },
    DapBreakpointHL = {
      fg = '#b15286',
      bg = '#3c3836'
    },
    DapLogPointHL = {
      fg = '#689d6a',
      bg = '#3c3836'
    },
    DapStoppedHL = {
      fg = '#a89984',
      bg = '#3c3836'
    },
  }
  for group, style in pairs(highlights) do
    highlight(group, style)
  end
end

load_highlights()
