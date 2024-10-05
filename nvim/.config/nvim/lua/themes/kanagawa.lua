return {
  "rebelot/kanagawa.nvim",
  config = function()
    require("kanagawa").setup({
      dimInactive = true, -- dim inactive window `:h hl-NormalNC`
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      theme = "wave", -- Load "wave" theme when 'background' option is not set
      background = { -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus",
      },
    })
  end,
}
