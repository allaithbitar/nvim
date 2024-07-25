return {
	"ojroques/nvim-bufdel",
	event = "BufReadPre",
	config = function()
		require("bufdel").setup({
			next = "tabs",
			quit = false, -- quit Neovim when last buffer is closed
		})
		vim.keymap.set("n", "<C-w>", "<cmd>BufDel<CR>", { silent = true, noremap = true })
	end,
}
