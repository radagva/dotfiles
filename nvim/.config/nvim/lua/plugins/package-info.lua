return {
  "vuki656/package-info.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  config = function()
    require("package-info").setup()

    -- Show dependency versions
    vim.keymap.set(
      { "n" },
      "<LEADER>cns",
      require("package-info").show,
      { silent = true, noremap = true, desc = "Show dependency version" }
    )

    -- Hide dependency versions
    vim.keymap.set(
      { "n" },
      "<LEADER>cnc",
      require("package-info").hide,
      { silent = true, noremap = true, desc = "Hide dependency version" }
    )

    -- Toggle dependency versions
    vim.keymap.set(
      { "n" },
      "<LEADER>cnt",
      require("package-info").toggle,
      { silent = true, noremap = true, desc = "Toggle dependency version" }
    )

    -- Update dependency on the line
    vim.keymap.set(
      { "n" },
      "<LEADER>cnu",
      require("package-info").update,
      { silent = true, noremap = true, desc = "Update dependency on line" }
    )

    -- Delete dependency on the line
    vim.keymap.set(
      { "n" },
      "<LEADER>cnd",
      require("package-info").delete,
      { silent = true, noremap = true, desc = "Delete dependency on line" }
    )

    -- Install a new dependency
    vim.keymap.set(
      { "n" },
      "<LEADER>cni",
      require("package-info").install,
      { silent = true, noremap = true, desc = "Install new dependency" }
    )

    -- Install a different dependency version
    vim.keymap.set(
      { "n" },
      "<LEADER>cnp",
      require("package-info").change_version,
      { silent = true, noremap = true, desc = "Install a different dependecy version" }
    )
  end,
}
