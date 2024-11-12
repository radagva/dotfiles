return {
  "crnvl96/lazydocker.nvim",
  event = "VeryLazy",
  opts = function()
    vim.keymap.set(
      "n",
      "<leader>k",
      "<cmd>LazyDocker<CR>",
      { desc = "Toggle LazyDocker", noremap = true, silent = true }
    )
  end, -- automatically calls `require("lazydocker").setup()`
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}
