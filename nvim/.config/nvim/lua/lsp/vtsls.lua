local on_attach = function(_, _)
	-- vim.keymap.set("n", "<leader>cM", vim.lsp.buf.add)
	vim.keymap.set("n", "<leader>co", function()
		vim.lsp.buf.code_action({
			apply = true,
			context = {
				only = { "source.organizeImports" },
				diagnostics = {},
			},
		})
	end, { desc = "Organize imports" })

	vim.keymap.set("n", "<leader>cu", function()
		vim.lsp.buf.code_action({
			apply = true,
			context = {
				only = { "source.removeUnused" },
				diagnostics = {},
			},
		})
	end, { desc = "Remove unused imports" })

	vim.keymap.set("n", "<leader>cm", function()
		vim.lsp.buf.code_action({
			apply = true,
			context = {
				only = { "source.addMissingImports" },
				diagnostics = {},
			},
		})
	end, { desc = "Add missing imports" })
end

return {
	-- explicitly add default filetypes, so that we can extend
	-- them in related extras
	on_attach = on_attach,
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	settings = {
		complete_function_calls = true,
		vtsls = {
			enableMoveToFileCodeAction = true,
			autoUseWorkspaceTsdk = true,
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
				},
			},
		},
		javascript = {
			suggest = {
				names = false,
			},
		},
		typescript = {
			updateImportsOnFileMove = { enabled = "always" },
			suggest = {
				completeFunctionCalls = true,
				names = false,
			},
			inlayHints = {
				enumMemberValues = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				variableTypes = { enabled = false },
			},
		},
	},
}
