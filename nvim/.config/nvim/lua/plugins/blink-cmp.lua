return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	version = "1.*",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
		"rafamadriz/friendly-snippets", -- useful snippets
	},
	opts = {
		keymap = {
			preset = "enter",
			["<C-k>"] = { "select_prev", "fallback" }, -- previous suggestion
			["<C-j>"] = { "select_next", "fallback" }, -- next suggestion
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<C-Space>"] = { "show" }, -- show completion suggestions
			["<C-e>"] = { "hide" }, -- close completion window
		},
		snippets = { preset = "luasnip" },
		completion = {
			list = {
				selection = { preselect = false, auto_insert = true },
			},
			documentation = { auto_show = true },
		},
		sources = {
			default = { "lazydev", "lsp", "snippets", "buffer", "path" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
	},
	config = function(_, opts)
		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()
		require("blink.cmp").setup(opts)
	end,
}
