return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>xx", "<cmd>Trouble<CR>", desc = "Open/close trouble list" },
		{
			"<leader>bd",
			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
			desc = "Open trouble document diagnostics",
		},
		{ "<leader>wd", "<cmd>Trouble diagnostics<CR>", desc = "Open trouble workspace diagnostics" },
		-- { "<leader>qa", "<cmd>TroubleToggle quickfix<CR>", desc = "Open trouble quickfix list" },
		-- { "<leader>tl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list" },
		-- { "<leader>xtt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
	},
	opts = {
		position = "bottom", -- position of the list can be: bottom, top, left, right
		height = 50,
	},
}
