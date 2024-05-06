return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		-- or                              , branch = '0.1.x',
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
			"folke/todo-comments.nvim",
		},
		config = function()
			local opts = { silent = true, noremap = true }
			local telescope = require("telescope")
			telescope.setup({
				defaults = { file_ignore_patterns = { "node_modules" }, path_display = { "smart" } },
			})

			telescope.load_extension("fzf")
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, opts)
			vim.keymap.set("n", "<leader>st", builtin.live_grep, opts)
			vim.keymap.set("n", "<leader>bf", function()
				builtin.buffers({
					sort_mru = true,
					ignore_current_buffer = true,
				})
			end)

			vim.keymap.set("n", "<leader>rf", builtin.oldfiles, opts)
			vim.keymap.set("n", "<leader>bs", builtin.lsp_document_symbols, opts)
			vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols, opts)
			vim.keymap.set("n", "<leader>sc", function()
				builtin.colorscheme({ enable_preview = true })
			end, opts)

			vim.keymap.set("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", opts)
			vim.keymap.set("n", "<leader>swt", "<cmd>TodoTelescope<cr>", opts)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			}
			require("telescope").load_extension("ui-select")
		end,
	},
}
