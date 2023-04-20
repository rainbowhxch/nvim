local onedarkpro = require("onedarkpro")
onedarkpro.setup({
  dark_theme = "onedark", -- The default dark theme
  light_theme = "onelight", -- The default light theme
  styles = {
      keywords = "NONE", -- Style that is applied to keywords
      functions = "NONE", -- Style that is applied to functions
  },
  options = {
      cursorline = true, -- Use cursorline highlighting?
      transparency = false, -- Use a transparent background?
      highlight_inactive_windows = false
  }
})
onedarkpro.load()
