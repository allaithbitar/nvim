return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup()
		vim.keymap.set({ "n", "t" }, "<M-1>", "<cmd>ToggleTerm 1 direction=float<CR>")
		vim.keymap.set({ "n", "t" }, "<M-2>", "<cmd>ToggleTerm 2 direction=float<CR>")
		vim.keymap.set({ "n", "t" }, "<M-3>", "<cmd>ToggleTerm 3 direction=float<CR>")
	end,
}
