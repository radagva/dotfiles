return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = true,
  opts = function()
    local theme = require("lualine.themes.gruvbox")
    theme.normal.c.bg = nil

    return {
      transparent_mode = true,
      dim_inactive = false,
    }
  end,
}
