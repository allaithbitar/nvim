return {
	-- {
	-- 	"Davidyz/VectorCode",
	-- 	version = "*", -- optional, depending on whether you're on nightly or release
	-- 	build = "pipx upgrade vectorcode", -- optional but recommended. This keeps your CLI up-to-date.
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	opts = {
	-- 		timeout_ms = 30000,
	-- 	},
	-- },
	{
		"olimorris/codecompanion.nvim",
		opts = {},
		config = function()
			require("codecompanion").setup({
				strategies = {
					-- Change the default chat adapter
					chat = {
						adapter = "gemini",
						inline = "gemini",
					},
				},
				adapters = {
					qwen_coder = function()
						return require("codecompanion.adapters").extend("ollama", {
							name = "qwen_coder", -- Give this adapter a different name to differentiate it from the default ollama adapter
							schema = {
								model = {
									default = "qwen2.5-coder:7b",
								},
							},
						})
					end,
					qwen3_4b = function()
						return require("codecompanion.adapters").extend("ollama", {
							name = "qwen3_4b ", -- Give this adapter a different name to differentiate it from the default ollama adapter
							schema = {
								model = {
									default = "qwen3:4b",
								},
							},
						})
					end,
					gemini = function()
						return require("codecompanion.adapters").extend("gemini", {
							schema = {
								model = {
									default = "gemini-2.0-flash-lite",
								},
							},
							env = {
								api_key = "AIzaSyCP3yj5IeYm6503Fnr_wXCm0VZkupOwm0Q",
							},
						})
					end,
					deepseek = function()
						return require("codecompanion.adapters").extend("deepseek", {
							env = {
								api_key = "sk-fd119950c4b945188038ca25239ba833",
							},
						})
					end,
				},

				display = {
					chat = {
						-- Change the default icons
						icons = {
							pinned_buffer = " ",
							watched_buffer = "👀 ",
						},

						-- Alter the sizing of the debug window
						debug_window = {
							---@return number|fun(): number
							width = vim.o.columns - 5,
							---@return number|fun(): number
							height = vim.o.lines - 2,
						},

						-- Options to customize the UI of the chat buffer
						window = {
							layout = "float", -- float|vertical|horizontal|buffer
							position = "right", -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
							border = "single",
							height = 0.8,
							width = 0.8,
							relative = "editor",
							full_height = true, -- when set to false, vsplit will be used to open the chat buffer vs. botright/topleft vsplit
							opts = {
								breakindent = true,
								cursorcolumn = false,
								cursorline = false,
								foldcolumn = "0",
								linebreak = true,
								list = false,
								numberwidth = 1,
								signcolumn = "no",
								spell = false,
								wrap = true,
							},
						},

						---Customize how tokens are displayed
						---@param tokens number
						---@param adapter CodeCompanion.Adapter
						---@return string
						-- token_count = function(tokens, adapter)
						-- return " (" .. tokens .. " tokens)"
						-- end,
					},
				},
				extensions = {
					-- vectorcode = {
					-- 	opts = {
					-- 		add_tool = true,
					-- 		add_slash_command = true,
					-- 	},
					-- },
					-- mcphub = {
					-- 	callback = "mcphub.extensions.codecompanion",
					-- 	opts = {
					-- 		show_result_in_chat = true, -- Show mcp tool results in chat
					-- 		make_vars = true, -- Convert resources to #variables
					-- 		make_slash_commands = true, -- Add prompts as /slash commands
					-- 	},
					-- },
				},
			})
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
