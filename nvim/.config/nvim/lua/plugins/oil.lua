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
			win_options = {
				winbar = "%{v:lua.require('oil').get_current_dir()}",
			},
		}

		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

		return options
	end,
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
