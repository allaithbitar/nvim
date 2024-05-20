return {
	"nvim-pack/nvir-spectre",
	config = function()
		vim.keymap.set("n", "<leader>sr", '<cmd>lua require("spectre").toggle()<CR>', {
			desc = "Toggle Spectre",
		})
	end,
}
