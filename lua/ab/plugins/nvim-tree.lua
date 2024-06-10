return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")

		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- OR setup with some options
		nvimtree.setup({

			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 40,
				-- adaptive_size = true,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				-- dotfiles = true,
			},
		})
		local nvim_tree_view = require("nvim-tree.view")
		vim.keymap.set("n", "<leader>e", function()
			if nvim_tree_view.is_visible() then
				vim.cmd([[NvimTreeToggle]])
			else
				vim.cmd([[NvimTreeFindFile]])
			end
		end, { silent = true })
	end,
}
