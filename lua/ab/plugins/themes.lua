return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{
		"dasupradyumna/midnight.nvim",
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
	},
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
	},
	{
		"Tsuzat/NeoSolarized.nvim",
	},
	{
		"ishan9299/nvim-solarized-lua",
	},
	{
		"miikanissi/modus-themes.nvim",
	},
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup({
				transparent_mode = true,
				contrast = "hard",
				italic = {
					strings = false,
					emphasis = true,
					comments = true,
					operators = true,
					folds = true,
				},
			})
		end,
	},
	{ "projekt0n/github-nvim-theme" },
	{ "martinsione/darkplus.nvim" },
	{ "Mofiqul/vscode.nvim" },
	{ "askfiy/visual_studio_code" },
	{
		"rockyzhang24/arctic.nvim",
		branch = "v2",
		dependencies = { "rktjmp/lush.nvim" },
	},
	{
		"sainnhe/sonokai",
	},
	{
		"ofirgall/ofirkai.nvim",
		branch = "exp",
		config = function()
			require("ofirkai").setup({
				remove_italics = true,
				theme = "dark_blue",
			})
		end,
	},
	{
		"Abstract-IDE/Abstract-cs",
	},
	{
		"marko-cerovac/material.nvim",
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				transparent = true,
				styles = {
					sidebars = "transparent",
				},
			})
		end,
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
	},
	{
		"comfysage/evergarden",
	},
	{
		"kyazdani42/blue-moon",
	},
	{
		"shaunsingh/nord.nvim",
	},
	{
		"neanias/everforest-nvim",
	},
	{
		"AlexvZyl/nordic.nvim",
	},
	{
		"kdheepak/monochrome.nvim",
	},
	{
		"mcchrish/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
	},
	{
		"EdenEast/nightfox.nvim",
	},
	{
		"kvrohit/substrata.nvim",
	},
	{
		"Mofiqul/dracula.nvim",
		config = function()
			require("dracula").setup({
				transparent_bg = true,
			})
		end,
	},
	{
		"oxfist/night-owl.nvim",
	},
}
