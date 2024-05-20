return {
	"jay-babu/mason-null-ls.nvim",
	lazy = true,
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"nvimtools/none-ls.nvim",
		"davidmh/cspell.nvim",
	},
	config = function()
		require("mason-null-ls").setup({
			automatic_installation = true,
			ensure_installed = {
				"eslint_d",
				"codespell",
				"cspell",
			},
		})
		local null_ls = require("null-ls")
		local cspell = require("cspell")
		local b = null_ls.builtins

		null_ls.setup({
			sources = {
				-- spell check
				b.diagnostics.codespell,
				-- cspell
				cspell.diagnostics.with({
					diagnostics_postprocess = function(diagnostic)
						diagnostic.severity = vim.diagnostic.severity["HINT"]
					end,
				}),
				cspell.code_actions,
				require("none-ls.code_actions.eslint_d"), -- requires none-ls-extras.nvim
			},
		})
	end,
}
