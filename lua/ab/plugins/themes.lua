return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		config = function()
			require("catppuccin").setup({
				lazy = true,
				no_italic = true,
			})
			-- code
		end,
	},
	{
		"dasupradyumna/midnight.nvim",
		lazy = true,
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = true,
	},
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		lazy = true,
	},
	{
		"Tsuzat/NeoSolarized.nvim",
		opts = {
			style = "dark", -- "dark" or "light",
		},
		lazy = true,
	},
	{
		"ishan9299/nvim-solarized-lua",
		lazy = true,
	},
	{
		"miikanissi/modus-themes.nvim",
		lazy = true,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
				transparent_mode = true,
				contrast = "hard",
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
			})
		end,
	},
	{ "projekt0n/github-nvim-theme", lazy = true },
	{ "martinsione/darkplus.nvim", lazy = true },
	{ "Mofiqul/vscode.nvim", lazy = true },
	{ "askfiy/visual_studio_code", lazy = true },
	{
		"rockyzhang24/arctic.nvim",
		branch = "v2",
		dependencies = { "rktjmp/lush.nvim" },
		lazy = true,
	},
	{
		"sainnhe/sonokai",
		lazy = true,
	},
	{
		"ofirgall/ofirkai.nvim",
		lazy = true,
		branch = "exp",
		config = function()
			require("ofirkai").setup({
				remove_italics = true,
			})
		end,
	},
	{
		"Abstract-IDE/Abstract-cs",
		lazy = true,
	},
	{
		"marko-cerovac/material.nvim",
		lazy = true,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		config = function()
			require("tokyonight").setup({
				cache = true,
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			})
		end,
	},
	{
		"vague2k/vague.nvim",
		lazy = true,
	},
	{
		"drewxs/ash.nvim",
		lazy = true,
	},
	{
		"tiagovla/tokyodark.nvim",
		lazy = true,
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
		lazy = true,
	},
	{
		"comfysage/evergarden",
		lazy = true,
	},
	{
		"kyazdani42/blue-moon",
		lazy = true,
	},
	{
		"shaunsingh/nord.nvim",
		lazy = true,
	},
	{
		"neanias/everforest-nvim",
		lazy = true,
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = true,
		config = function()
			require("nordic").setup({
				bright_border = true,
				bold_keywords = true,
				cursorline = {
					theme = "dark",
					blend = 1,
				},
				telescope = {
					style = "classic",
				},
			})
		end,
	},
	{
		"kdheepak/monochrome.nvim",
		lazy = true,
	},
	{
		"mcchrish/zenbones.nvim",
		lazy = true,
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
	},
	{
		"kvrohit/substrata.nvim",
		lazy = true,
	},
	{
		"Mofiqul/dracula.nvim",
		lazy = true,
		-- config = function()
		-- 	require("dracula").setup({
		-- 	})
		--     -- transparent_bg = true,
		-- end,
	},
	{
		"oxfist/night-owl.nvim",
		lazy = true,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
	},
	{
		"rose-pine/neovim",
		as = "rose-pine",
		priority = 1000,
		config = function()
			-- require("solarized-osaka").setup({
			-- 	variant = "",
			-- 	background = "",
			-- 	ui_contrast = "high",
			-- })
			require("rose-pine").setup({
				variant = "moon",
				dark_variant = "moon",
				palette = {
					moon = {
						base = "#000000",
					},
				},

				styles = {
					italic = false,
					transparency = false,
				},
			})
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		config = function()
			require("solarized-osaka").setup({ transparent = false })
		end,
		lazy = false,
	},
	{
		"olivercederborg/poimandres.nvim",
		lazy = true,
		-- priority = 1000,
		config = function()
			require("poimandres").setup({
				-- leave this setup function empty for default config
				-- or refer to the configuration section
				-- for configuration options
			})
		end,
	},
	-- { "RRethy/base16-nvim" },
	{ "AhmedAbdulrahman/aylin.vim", branch = "0.5-nvim", lazy = true },
	{
		"Yazeed1s/oh-lucy.nvim",
		lazy = true,
	},
	{
		"ankushbhagats/pastel.nvim",
		lazy = true,
		-- priority = 1000, -- load immediately at startup
		-- opts = {}, -- your configuration comes here
		-- config = true, -- call setup function with provided opts
	},
}
