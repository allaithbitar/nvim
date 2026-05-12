return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = {
				enabled = true,
				preset = {
					keys = {
						{
							icon = "󰱼 ",
							key = "crtl p",
							desc = "Find File",
							action = ":lua Snacks.dashboard.pick('files')",
						},
						{
							icon = " ",
							key = "space st",
							desc = "Find Text",
							action = ":lua Snacks.dashboard.pick('live_grep')",
						},
						{
							icon = " ",
							key = "space rf",
							desc = "Recent Files",
							action = ":lua Snacks.dashboard.pick('oldfiles')",
						},
						-- { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
						-- { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						-- {
						-- 	icon = " ",
						-- 	key = "c",
						-- 	desc = "Config",
						-- 	action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
						-- },
						{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
						{
							icon = "󰒲 ",
							key = "L",
							desc = "Lazy",
							action = ":Lazy",
							enabled = package.loaded.lazy ~= nil,
						},
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
					header = [[
█████╗ ██╗████████╗ █████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
██╔══██╗██║╚══██╔══╝██╔══██╗██╔══██╗██║   ██║██║████╗ ████║
██████╔╝██║   ██║   ███████║██████╔╝██║   ██║██║██╔████╔██║
██╔══██╗██║   ██║   ██╔══██║██╔══██╗╚██╗ ██╔╝██║██║╚██╔╝██║
██████╔╝██║   ██║   ██║  ██║██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═════╝ ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
        ]],
				},
			},
			explorer = { enabled = true },
			picker = {
				enabled = true,
				layout = "ivy",
				ui_select = true,
			},
			indent = { enabled = true },
			input = { enabled = true },
			notifier = {
				enabled = true,
			},
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
		keys = {
			{
				"<c-p>",
				function()
					Snacks.picker.smart({
						exclude = { ".git", "node_modules" },
						filter = {
							paths = {
								node_modules = false,
							},
							cwd = true,
						},
					})
				end,
				desc = "Smart Find Files",
			},
			{
				"<leader>bf",
				function()
					Snacks.picker.buffers({
						current = false,
						filter = {
							cwd = true,
						},
					})
				end,
				desc = "Buffers",
			},
			{
				"<leader>bs",
				function()
					Snacks.picker.lines()
				end,
				desc = "Buffer Lines",
			},
			{
				"<leader>st",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>sw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "Search Word",
			},
			{
				"<leader>ws",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "Workspace Symbols",
			},
			{
				"<leader>bs",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "Buffer Symbols",
			},
			{
				"<leader>rf",
				function()
					Snacks.picker.recent({ filter = {
						cwd = true,
					} })
				end,
				desc = "Recent Files",
			},
			{
				"<leader>sc",
				function()
					Snacks.picker.colorschemes()
				end,
				desc = "Colorschemes",
			},
			-- {
			-- 	"<leader>bd",
			-- 	function()
			-- 		Snacks.picker.diagnostics_buffer()
			-- 	end,
			-- 	desc = "Buffer Diagnostics",
			-- },
			-- {
			-- 	"<leader>wd",
			-- 	function()
			-- 		Snacks.picker.diagnostics()
			-- 	end,
			-- 	desc = "Workspace Diagnostics",
			-- },
			{
				"gd",
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = "Goto Definition",
			},
			{
				"gD",
				function()
					Snacks.picker.lsp_declarations()
				end,
				desc = "Goto Declaration",
			},
			{
				"gr",
				function()
					Snacks.picker.lsp_references()
				end,
				nowait = true,
				desc = "References",
			},
			{
				"gI",
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = "Goto Implementation",
			},
			{
				"gt",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = "Goto types Definition",
			},
			{
				"<c-w>",
				function()
					Snacks.bufdelete()
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>gg",
				function()
					Snacks.lazygit()
				end,
				desc = "LazyGit",
			},
			{
				"<leader>e",
				function()
					---@diagnostic disable-next-line: missing-fields
					Snacks.explorer({
						hidden = true,
						ignored = true,
						layout = {
							layout = {
								position = "left",
							},
						},
						exclude = { ".git", "node_modules" },
					})
				end,
				desc = "Files Explorer",
			},
			{
				"<leader>gb",
				function()
					Snacks.picker.git_branches()
				end,
				desc = "Git Banches",
			},
			{
				"<leader>gL",
				function()
					Snacks.picker.git_log()
				end,
				desc = "Git Log",
			},
			{
				"<leader>gll",
				function()
					Snacks.picker.git_log_line()
				end,
				desc = "Git Log Line",
			},
			{
				"<leader>glf",
				function()
					Snacks.picker.git_log_file()
				end,
				desc = "Git Log File",
			},
			{
				"<leader>gD",
				function()
					Snacks.picker.git_diff()
				end,
				desc = "Git Diff",
			},
		},
		-- config = function()
		-- end,
	},
}
