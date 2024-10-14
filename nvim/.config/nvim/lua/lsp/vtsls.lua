return {
	-- explicitly add default filetypes, so that we can extend
	-- them in related extras
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
		typescript = {
			updateImportsOnFileMove = { enabled = "always" },
			suggest = {
				completeFunctionCalls = true,
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
	-- keys = {
	-- 	{
	-- 		"<leader>cM",
	-- 		-- vim.lsp.action["source.addMissingImports.ts"],
	-- 		function()
	-- 			vim.lsp.buf.execute_command({
	-- 				command = "_typescript.addMissingImports",
	-- 				arguments = { vim.uri_from_bufnr(0) },
	-- 			})
	-- 		end,
	-- 		desc = "Add missing imports",
	-- 	},
	-- 	{
	-- 		"<leader>cu",
	-- 		-- vim.lsp.action["source.removeUnused.ts"],
	-- 		function()
	-- 			vim.lsp.buf.execute_command({
	-- 				command = "_typescript.removeUnused",
	-- 				arguments = { vim.uri_from_bufnr(0) },
	-- 			})
	-- 		end,
	-- 		desc = "Remove unused imports",
	-- 	},
	-- },
	-- on_attach = function(_, bfrn)
	-- 	local map = vim.keymap.set
	--
	-- 	local organize_imports = function()
	-- 		vim.lsp.buf.execute_command({
	-- 			command = "typescript.organizeImports",
	-- 			arguments = { buffer = bfrn },
	-- 		})
	-- 		-- require("vtsls").commands["organize_imports"](bfrn)
	-- 	end
	--
	-- 	map("n", "<leader>co", organize_imports, { desc = "Organize Imports", noremap = true, silent = false })
	-- end,
}
