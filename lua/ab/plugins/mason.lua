return {
	{
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

			mason_lspconfig.setup({
				ensure_installed = { "lua_ls", "tsserver", "eslint", "cssls", "jsonls", "tailwindcss" },
			})

			mason_tool_installer.setup({
				ensure_installed = { "stylua", "eslint_d", "prettierd", "shfmt" },
			})
		end,
	},
}
-- {
-- 	"williamboman/mason-lspconfig.nvim",
-- 	config = function()
-- 		require("mason-lspconfig").setup({})
-- 	end,
-- },

-- 	{
-- 		"jay-babu/mason-null-ls.nvim",
-- 		lazy = true,
-- 		dependencies = {
-- 			"williamboman/mason.nvim",
-- 			"nvimtools/none-ls.nvim",
-- 		},
-- 		config = function()
-- 			require("mason-null-ls").setup({
-- 				automatic_installation = true,
-- 			})
-- 			local null_ls = require("null-ls")
--
-- 			null_ls.setup({
-- 				sources = {
-- 					null_ls.builtins.formatting.stylua,
-- 					null_ls.builtins.formatting.prettierd,
-- 					null_ls.builtins.formatting.shfmt,
-- 					null_ls.builtins.diagnostics.eslint_d,
-- 				},
-- 			})
-- 		end,
-- 	},
-- }
