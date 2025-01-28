return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "echasnovski/mini.icons" },
	opts = function()
		local actions = require("fzf-lua").actions
		actions = {
			-- Below are the default actions, setting any value in these tables will override
			-- the defaults, to inherit from the defaults change [1] from `false` to `true`
			files = {
				-- true,        -- uncomment to inherit all the below in your custom config
				-- Pickers inheriting these actions:
				--   files, git_files, git_status, grep, lsp, oldfiles, quickfix, loclist,
				--   tags, btags, args, buffers, tabs, lines, blines
				-- `file_edit_or_qf` opens a single selection or sends multiple selection to quickfix
				-- replace `enter` with `file_edit` to open all files/bufs whether single or multiple
				-- replace `enter` with `file_switch_or_edit` to attempt a switch in current tab first
				["enter"] = actions.file_edit_or_qf,
				["ctrl-s"] = actions.file_split,
				["ctrl-v"] = actions.file_vsplit,
				-- ["ctrl-t"] = actions.file_tabedit,
				-- ["alt-q"] = actions.file_sel_to_qf,
				-- ["alt-Q"] = actions.file_sel_to_ll,
				["alt-i"] = actions.toggle_ignore,
				["alt-h"] = actions.toggle_hidden,
				-- ["alt-f"] = actions.toggle_follow,
			},
		}

		return {
			actions = actions,
			files = {
				prompt = "Files❯ ",
			},
		}
	end,
}
