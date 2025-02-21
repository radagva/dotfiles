return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		priority = 1000,
		config = true,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/lazydev.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")

			local spread = require("config.utils").spread
			local vtsls = require("lsp.vtsls")
			local angularls = require("lsp.angularls")
			local lua_ls = require("lsp.lua_ls")
			local html = require("lsp.html")

			local servers = {
				lua_ls = lua_ls,
				html = html,
				vtsls = vtsls,
				eslint = {},
				angularls = angularls,
				graphql = {},
				pyright = {},
				tailwindcss = {},
				sqlls = {},
				cssls = {},
				emmet_ls = {},
				jsonls = {},
				yamlls = {},
				clangd = {},
				ruff = {
					on_attach = function(_, _)
						vim.keymap.set(
							"n",
							"<leader>cv",
							"<cmd>VenvSelect<cr>",
							{ desc = "Open python venv selector", noremap = true }
						)
					end,
					init_options = {
						settings = {
							args = {},
						},
					},
				},
			}

			local ensure_installed = vim.tbl_keys(servers or {})

			require("mason-lspconfig").setup({
				ensure_installed = ensure_installed,
			})

			local border = {
				{ "🭽", "FloatBorder" },
				{ "▔", "FloatBorder" },
				{ "🭾", "FloatBorder" },
				{ "▕", "FloatBorder" },
				{ "🭿", "FloatBorder" },
				{ "▁", "FloatBorder" },
				{ "🭼", "FloatBorder" },
				{ "▏", "FloatBorder" },
			}

			-- LSP settings (for overriding per client)
			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
			}

			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local create_on_attach = function(server, extra)
				local on_attach = function(_, bufnr)
					local opts = spread({ noremap = true, silent = true, buffer = bufnr })

					local map = vim.keymap.set

					-- For help
					map("n", "K", vim.lsp.buf.hover)

					-- for diagnosis
					map("n", "[d", vim.diagnostic.goto_prev, opts({ silent = false, desc = "go to prev diagnosis" }))
					map("n", "]d", vim.diagnostic.goto_next, opts({ silent = false, desc = "go to next diagnosis" }))
					map("n", "gd", vim.lsp.buf.definition, opts({}))
					map("n", "gD", vim.lsp.buf.declaration, opts({}))
					map("n", "gi", vim.lsp.buf.implementation, opts({}))
					map("n", "<leader>ca", vim.lsp.buf.code_action, opts({}))
					map("n", "gr", require("fzf-lua").lsp_references, opts({}))

					if server.on_attach then
						server.on_attach(_, bufnr)
					end

					if extra ~= nil then
						extra()
					end
				end

				return on_attach
			end

			for _, value in ipairs(ensure_installed) do
				local server = servers[value]

				local on_attach = create_on_attach(server)

				lspconfig[value].setup(spread(server)({
					on_attach = on_attach,
					handlers = handlers,
					capabilities = capabilities,
				}))
			end

			local local_servers = {
				"kulala_ls",
				"sourcekit",
			}

			for _, lsp in ipairs(local_servers) do
				if lspconfig[lsp] ~= nil then
					if lspconfig[lsp].setup ~= nil then
						lspconfig[lsp].setup({
							on_attach = create_on_attach(lspconfig[lsp], function()
								if lsp == "kulala_ls" then
									vim.keymap.set("n", "<C-r>", function()
										require("kulala").run()
									end, { silent = true })
								end
							end),
							capabilities = capabilities,
							handlers = handlers,
							cmd = lsp == "sourcekit" and { vim.trim(vim.fn.system("xcrun -f sourcekit-lsp")) } or nil,
						})
					else
						vim.notify("LSP server " .. lsp .. " does not have a setup function", vim.log.levels.ERROR)
					end
				end
			end

			vim.filetype.add({
				pattern = {
					[".*%.component%.html"] = "htmlangular", -- Sets the filetype to `htmlangular` if it matches the pattern
					-- [".*%.component%.css"] = "cssangular", -- Sets the filetype to `htmlangular` if it matches the pattern
				},
			})

			vim.filetype.add({
				extension = {
					["http"] = "http",
				},
			})

			vim.diagnostic.config({
				virtual_text = true,
				float = {
					header = false,
					border = "rounded",
					focusable = true,
				},
			})

			vim.api.nvim_set_hl(0, "NormalFloat", {
				link = "none",
			})
			vim.api.nvim_set_hl(0, "FloatBorder", {
				bg = "none",
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		requires = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettierd",
					"black",
					"isort",
					"stylua",
				},
			})
		end,
	},
	{
		"j-hui/fidget.nvim",
		-- tag = "legacy",
		opts = {
			notification = {
				window = {
					winblend = 0, -- note: not winblend!
					relative = "editor",
				},
			},
		},
	},
}
