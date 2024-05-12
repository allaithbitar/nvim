return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver", "eslint", "cssls", "jsonls", "tailwindcss" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local keymap = vim.keymap

			local lspconfig = require("lspconfig")

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local opts = { silent = true, noremap = true }

			-- keymap.set("n", "<leader>lf", function()
			-- 	vim.lsp.buf.format({ async = true })
			-- end, opts)

			local on_attach = function(client, bufnr)
				opts.buffer = bufnr

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>qa", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				-- opts.desc = "Show buffer diagnostics"
				-- keymap.set("n", "<leader>lbd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
				--
				-- opts.desc = "Show line diagnostics"
				-- keymap.set("n", "<leader>lld", vim.diagnostic.open_float, opts) -- show diagnostics for line
				--
				-- opts.desc = "Show workspace diagnostics"
				-- keymap.set("n", "<leader>lwd", "<cmd>Telescope diagnostics<CR>", opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				-- opts.desc = "Restart LSP"
				-- keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.eslint.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.astro.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		lazy = true,
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = { "stylua", "eslint_d", "prettierd", "shfmt" },
				automatic_installation = true,
			})
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.shfmt,
					null_ls.builtins.diagnostics.eslint_d,
				},
			})
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					client.server_capabilities.semanticTokensProvider = nil
				end,
			})
		end,
	},
}
