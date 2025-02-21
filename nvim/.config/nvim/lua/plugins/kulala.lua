return {
	"mistweaverco/kulala.nvim",
	config = function()
		require("kulala").setup({
			default_view = "headers_body",
		})
	end,
}
