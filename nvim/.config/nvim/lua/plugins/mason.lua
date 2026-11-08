return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		local servers = {
			"ts_ls",
			"html",
			"cssls",
			"tailwindcss",
			"lua_ls",
			"pyright",
		}

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = servers,
			-- only auto-enable actual language servers (prevents tools like
			-- stylua, installed via mason-tool-installer, from being started as LSPs)
			automatic_enable = servers,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"eslint_d",
			},
			auto_update = false,
		})
	end,
}
