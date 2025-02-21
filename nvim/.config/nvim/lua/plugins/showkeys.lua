return {
	"nvzone/showkeys",
	cmd = "ShowkeysToggle",
	opts = {
		timeout = 3,
		maxkeys = 5,
		position = "bottom-center",
		excluded_modes = { "i" },
	},
	keys = {
		{ "<leader>us", "<cmd>ShowkeysToggle<cr>", desc = "Toggle show keys" },
	},
}
