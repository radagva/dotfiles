local spread = require("config.utils").spread
vtsls = require("lsp.vtsls")

local servers = {
	ruff = {},
	pylsp = {
		settings = {
			pylsp = {
				plugins = {
					pyflakes = { enabled = false },
					pycodestyle = { enabled = false },
					autopep8 = { enabled = false },
					yapf = { enabled = false },
					mccabe = { enabled = false },
					pylsp_mypy = { enabled = false },
					pylsp_black = { enabled = false },
					pylsp_isort = { enabled = false },
				},
			},
		},
	},
	html = { filetypes = { "html", "twig", "hbs" } },
	vtsls = vtsls,
	cssls = {},
	tailwindcss = {},
	dockerls = {},
	sqlls = {},
	emmet_ls = {},
	angularls = {
		filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
	},
	jsonls = {},
	yamlls = {},

	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
				runtime = { version = "LuaJIT" },
				workspace = {
					checkThirdParty = false,
					library = {
						"${3rd}/luv/library",
						unpack(vim.api.nvim_get_runtime_file("", true)),
					},
				},
				diagnostics = { disable = { "missing-fields" } },
				format = {
					enable = false,
				},
			},
		},
	},
}

local ensure_installed = vim.tbl_keys(servers or {})

return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		priority = 999,
		config = function()
			-- LSP servers and clients are able to communicate to each other what features they support.
			--  By default, Neovim doesn't support everything that is in the LSP specification.
			--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
			--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			require("mason-tool-installer").setup({
				ensure_installed = vim.tbl_keys(spread(servers)({
					prettier = {},
					eslint_d = {},
				})),
			})

			require("mason-lspconfig").setup({
				ensure_installed = ensure_installed,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})

						local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

						function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
							opts = opts or {}

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

							opts.border = opts.border or border
							return orig_util_open_floating_preview(contents, syntax, opts, ...)
						end

						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		priority = 998,
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			{ "j-hui/fidget.nvim", opts = {} },
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					local source_actions = function()
						vim.lsp.buf.code_action({
							apply = true,
							context = {
								only = { "source" },
								diagnostics = {},
							},
						})
					end

					local toggle_inlay_hints = function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end

					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
					map("<leader>cA", source_actions, "Source Actions", { "n", "x" })
					map("<leader>th", toggle_inlay_hints, "[T]oggle Inlay [H]ints")
				end,
			})

			vim.filetype.add({
				pattern = {
					[".*%.component%.html"] = "htmlangular", -- Sets the filetype to `htmlangular` if it matches the pattern
				},
			})
		end,
	},
}
