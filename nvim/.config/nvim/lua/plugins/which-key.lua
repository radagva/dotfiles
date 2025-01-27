return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
		{
			"<leader>g",
			function() end,
			desc = "Git",
		},
		-- GIT
		{
			"<leader>gg",
			function()
				Snacks.lazygit.open()
			end,
			desc = "Open lazygit",
		},
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git Blame Line",
		},
		{
			"<leader>ocp",
			function()
				require("minty.huefy").open()
			end,
			desc = "Open color picker",
		},
		{
			"<leader>ocs",
			function()
				require("minty.shades").open()
			end,
			desc = "Open color shades",
		},
		-- FZF
		{
			"<leader><leader>",
			require("fzf-lua").files,
			desc = "Search in directory",
		},
		{
			"<leader>sb",
			require("fzf-lua").buffers,
			desc = "Search opened buffers",
		},
		{
			"<leader>sc",
			function()
				require("fzf-lua").files({ cwd = "~/.dotfiles", cmd = "fd --hidden --exclude .git" })
			end,
			desc = "Search into dotfiles",
		},
		{
			"<leader>sr",
			function()
				require("fzf-lua").files({ resume = true })
			end,
			desc = "Resume previous search",
		},
		{
			"<leader>sg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Resume previous search",
		},
	},
}
