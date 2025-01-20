return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		-- transparent = true,
		on_colors = function(colors)
			colors.bg_statusline = "NONE"
		end,
		styles = {
			-- floats = "transparent",
		},
	},
}
