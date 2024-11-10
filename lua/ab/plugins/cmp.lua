local function tooBig(bufnr)
	local max_filesize = 10 * 1024 -- 100 KB
	local check_stats = (vim.uv or vim.loop).fs_stat
	local ok, stats = pcall(check_stats, vim.api.nvim_buf_get_name(bufnr))
	if ok and stats and stats.size > max_filesize then
		return true
	else
		return false
	end
end

local preferred_sources = {
	{ name = "nvim_lsp" },
	{ name = "luasnip" }, -- snippets
	{ name = "path" }, -- file system paths
	-- { name = "buffer", keyword_length = 4 }, -- text within current buffer
}

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-cmdline", -- sources for cmd,
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")

		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			performance = {
				max_view_entries = 20,
				debounce = 0,
				throttle = 0,
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			-- formatting = {
			-- 				format = lspkind.cmp_format({
			-- 					maxwidth = 50,
			-- 					ellipsis_char = "...",
			-- 				}),
			-- 			},
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
					ellipsis_char = "...",
					menu = {
						nvim_lsp = "[LSP]",
						path = "[Path]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						buffer = "[Buffer]",
						treesitter = "[Treesitter]",
						cmp_git = "[Git]",
						tmux = "[Tmux]",
						rg = "[Rg]",
						dictionary = "[Dictionary]",
					},
				}),
				expandable_indicator = true,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			-- sources for autocompletion
			sources = cmp.config.sources(preferred_sources),
		})

		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" },
			}, {
				{ name = "buffer" },
			}),
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer", keyword_length = 4 },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})

		vim.api.nvim_create_autocmd("BufRead", {
			group = vim.api.nvim_create_augroup("CmpBufferDisableGrp", { clear = true }),
			callback = function(ev)
				local sources = preferred_sources
				if not tooBig(ev.buf) then
					sources[#sources + 1] = { name = "buffer", keyword_length = 4 }
				end
				cmp.setup.buffer({
					sources = cmp.config.sources(sources),
				})
			end,
		}) -- create a treshhold for big files (end)
	end,
}
