return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = function()
		local actions = require("fzf-lua").actions

		actions = {
			files = {
				["enter"] = actions.file_edit_or_qf,
				["ctrl-s"] = actions.file_split,
				["ctrl-v"] = actions.file_vsplit,
				["alt-i"] = actions.toggle_ignore,
				["alt-h"] = actions.toggle_hidden,
			},
		}

		return {
			actions = actions,
			files = {
				cwd_prompt = false,
				prompt = "Search ❯ ",
				formatter = "path.filename_first",
			},
			winopts = {
				preview = {
					layout = "vertical",
				},
			},
		}
	end,
}
