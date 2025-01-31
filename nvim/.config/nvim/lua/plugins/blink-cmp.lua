return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	opts = {
		keymap = { preset = "default" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		signature = { enabled = true },
		sources = {
			-- add vim-dadbod-completion to your completion providers
			default = { "lsp", "path", "snippets", "buffer", "dadbod" },
			providers = {
				dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
			},
		},
		-- sources = {
		-- 	default = { "lsp", "path", "snippets", "buffer" },
		-- },
		-- completion = {
		-- 	list = { selection = { preselect = true, auto_insert = true } },
		-- },
	},
	-- opts_extend = { "sources.default" },
}
