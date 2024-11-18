return {
  "stevearc/oil.nvim",
  opts = function()
    local options = {
      keymaps = {
        ["<C-v>"] = {
          callback = function()
            require("oil").select({ vertical = true, close = true })
          end,
          desc = "select_vsplit",
          mode = "n",
        },
        ["<C-s>"] = {
          callback = function()
            require("oil").select({ horizontal = true, close = true })
          end,
          desc = "select_vsplit",
          mode = "n",
        },
      },
    }

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

    return options
  end,
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- config = function()
  --   require("oil").setup({
  --     default_file_explorer = true,
  --     float = {
  --       -- Padding around the floating window
  --       padding = 10,
  --       max_width = 0,
  --       max_height = 0,
  --       border = "rounded",
  --       win_options = {
  --         winblend = 0,
  --       },
  --       -- This is the config that will be passed to nvim_open_win.
  --       -- Change values here to customize the layout
  --       override = function(conf)
  --         return conf
  --       end,
  --     },
  --   })
  --
  --   -- vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
  --   vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  -- end,
}
