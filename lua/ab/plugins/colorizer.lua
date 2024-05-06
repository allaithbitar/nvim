return {
	"norcalli/nvim-colorizer.lua",
	setup = function()
		require("colorizer").setup()
		vim.cmd([[ColorizerToggle]])
	end,
}
