local on_attach = function(_, _)
	vim.keymap.set("n", "<leader>cv", "<cmd>VenvSelect<cr>", { desc = "Open python venv selector", noremap = true })
end

return {
	on_attach = on_attach,
	filetypes = { "python" },
	settings = {
		pylsp = {
			plugins = {
				black = { enabled = true },
				isort = { enabled = true, profile = "black" },
			},
		},
	},
}
