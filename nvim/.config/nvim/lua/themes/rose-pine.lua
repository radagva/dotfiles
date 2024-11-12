return {
  "rose-pine/neovim",
  name = "rose-pine",
  opts = function()
    vim.opt.pumblend = 0

    return {
      variant = "moon",
      highlight_groups = {
        NormalFloat = { bg = "none" },
      },
    }
  end,
}
