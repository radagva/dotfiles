return {
	"pwntester/octo.nvim",
	requires = {
		"nvim-lua/plenary.nvim",
		"ibhagwan/fzf-lua",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("octo").setup({ enable_builtin = true })
	end,
	keys = {
		{ "<leader>go", "<cmd>Octo<cr>", desc = "Octo" },
	},
}
