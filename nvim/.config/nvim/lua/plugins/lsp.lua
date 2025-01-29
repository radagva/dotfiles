local spread = require("config.utils").spread
local vtsls = require("lsp.vtsls")
local angularls = require("lsp.angularls")
local lua_ls = require("lsp.lua_ls")
local html = require("lsp.html")

local servers = {
	html = html,
	vtsls = vtsls,
	angularls = angularls,
	lua_ls = lua_ls,
	gopls = {},
	cssls = {},
	emmet_ls = {},
	jsonls = {},
	yamlls = {},
}

local ensure_installed = vim.tbl_keys(servers or {})

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

			for _, value in ipairs(ensure_installed) do
				local server = servers[value]

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
				end

				lspconfig[value].setup(spread(server)({
					on_attach = on_attach,
					handlers = handlers,
					capabilities = capabilities,
				}))
			end

			vim.filetype.add({
				pattern = {
					[".*%.component%.html"] = "htmlangular", -- Sets the filetype to `htmlangular` if it matches the pattern
					-- [".*%.component%.css"] = "cssangular", -- Sets the filetype to `htmlangular` if it matches the pattern
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
