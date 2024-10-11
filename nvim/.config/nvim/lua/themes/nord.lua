return {
	"shaunsingh/nord.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		local nord = require("nord")
		vim.g.nord_contrast = true
		vim.g.nord_borders = false
		vim.g.nord_disable_background = false
		vim.g.nord_italic = false
		vim.g.nord_uniform_diff_background = true
		vim.g.nord_bold = false

		nord.set()

		local transparent = true

		local toggle_transparency = function()
			transparent = not transparent
			vim.g.nord_disable_background = transparent
			vim.cmd([[colorscheme nord]])
		end

		vim.keymap.set(
			"n",
			"<leader>ubt",
			toggle_transparency,
			{ desc = "Toggle background transparency", silent = true, noremap = true }
		)
	end,
}
