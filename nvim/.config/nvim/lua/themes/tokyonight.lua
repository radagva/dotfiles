return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
		on_colors = function(colors)
			colors.bg_statusline = "NONE"

			-- vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC", bold = true })
			vim.api.nvim_set_hl(0, "LineNr", { fg = "#FF966C", bold = true })
			-- vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F", bold = true })
		end,
		styles = {
			floats = "transparent",
		},
	},
}
