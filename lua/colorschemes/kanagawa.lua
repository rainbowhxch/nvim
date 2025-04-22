require('kanagawa').setup({
    transparent = false,         -- do not set background color
    dimInactive = true,         -- dim inactive window `:h hl-NormalNC`
    theme = "wave",              -- Load "wave" theme
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})
vim.cmd.colorscheme("kanagawa")
