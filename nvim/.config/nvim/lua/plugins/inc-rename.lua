return {
	"smjonas/inc-rename.nvim",
	config = function()
		require("inc_rename").setup()
		local wk = require("which-key")

		wk.add({
			{ "<leader>c", group = "code" },
			{
				"<leader>cr",
				function()
					return ":IncRename " .. vim.fn.expand("<cword>")
				end,
				expr = true,
				desc = "Rename Symbol",
			},
		})

		-- vim.keymap.set("n", "<leader>rn", function()
		-- 	return ":IncRename " .. vim.fn.expand("<cword>")
		-- end, { expr = true })
	end,
}
