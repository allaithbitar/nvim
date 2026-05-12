return {
	{
		event = "BufReadPre",
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		-- branch = "v1.x",
		config = function()
			-- import mason
			local mason = require("mason")

			-- import mason-lspconfig
			-- local mason_lspconfig = require("mason-lspconfig")

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

			-- mason_lspconfig.setup({
			-- 	automatic_enable = false,
			-- 	ensure_installed = {
			-- 		"lua_ls",
			-- 		"ts_ls",
			-- 		"eslint",
			-- 		"cssls",
			-- 		"jsonls",
			-- 		"tailwindcss",
			-- 		"html",
			-- 		"angularls",
			-- 	},
			-- 	automatic_installation = true,
			-- })
			--
			mason_tool_installer.setup({
				ensure_installed = { "stylua", "eslint_d", "prettierd", "shfmt" },
			})
		end,
	},
}
