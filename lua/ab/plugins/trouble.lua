return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	keys = {
		{ "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Open/close trouble list" },
		{ "<leader>wd", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open trouble workspace diagnostics" },
		{ "<leader>bd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open trouble document diagnostics" },
		-- { "<leader>qa", "<cmd>TroubleToggle quickfix<CR>", desc = "Open trouble quickfix list" },
		-- { "<leader>tl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list" },
		-- { "<leader>xtt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
	},
	opts = {
		position = "right", -- position of the list can be: bottom, top, left, right
		width = 75,
	},
}
