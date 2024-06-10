return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local keymap = vim.keymap

		local lspconfig = require("lspconfig")

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local opts = { silent = true, noremap = true, buffer = args.buf }

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

				-- opts.desc = "Show function signature"
				-- keymap.set("n", "gs", vim.lsp.buf.signature_help, opts) -- show documentation for what is under cursor

				-- opts.desc = "Restart LSP"
				-- keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

				local client = vim.lsp.get_client_by_id(args.data.client_id)
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.tsserver.setup({
			capabilities = capabilities,
		})
		lspconfig.eslint.setup({
			capabilities = capabilities,
			settings = {
				settings = {
					workingDirectory = { mode = "location" },
				},
			},
			root_dir = lspconfig.util.find_git_ancestor,
		})
		lspconfig.cssls.setup({
			capabilities = capabilities,
		})
		lspconfig.html.setup({
			capabilities = capabilities,
		})
		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
		})
		lspconfig.astro.setup({
			capabilities = capabilities,
		})
		lspconfig.prismals.setup({
			capabilities = capabilities,
		})

		-- Angular -- start
		--[[ 	local ok, mason_registry = pcall(require, "mason-registry")
		if not ok then
			vim.notify("mason-registry could not be loaded")
			return
		end

		local angularls_path = mason_registry.get_package("angular-language-server"):get_install_path()

		local cmd = {
			"ngserver",
			"--stdio",
			"--tsProbeLocations",
			table.concat({
				angularls_path,
				vim.uv.cwd(),
			}, ","),
			"--ngProbeLocations",
			table.concat({
				angularls_path .. "/node_modules/@angular/language-server",
				vim.uv.cwd(),
			}, ","),
		} ]]

		lspconfig.angularls.setup({
			capabilities = capabilities,
			--[[ 	cmd = cmd,
			on_new_config = function(new_config)
				new_config.cmd = cmd
			end, ]]
		})

		-- Angular -- end

		--[[ lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
			filetypes = { "rust" },
			root_dir = lspconfig.util.root_pattern("Cargo.toml"),
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
					},
				},
			},
		}) ]]
	end,
}
