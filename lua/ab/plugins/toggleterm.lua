return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = true,
	keys = {
		{
			"<M-1>",
			"<cmd>ToggleTerm 1 direction=float<CR>",
			desc = "Term 1",
		},
		{
			"<M-2>",
			"<cmd>ToggleTerm 2 direction=float<CR>",
			desc = "Term 2",
		},
		{
			"<M-3>",
			"<cmd>ToggleTerm 3 direction=float<CR>",
			desc = "Term 3",
		},
	},
	opts = {},
}
