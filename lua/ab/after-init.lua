-- vim.g.solarized_termtrans = 1

-- let g:sonokai_style = 'andromeda'
-- vim.g.sonokai_style = "shusia"
-- vim.g.sonokai_better_performance = 1
-- vim.g.neosolarized_contrast = "high"
-- vim.g.nightflyTransparent = true

vim.cmd([[colorscheme solarized-osaka]])
-- vim.cmd([[colorscheme evergarden]])
-- vim.cmd([[colorscheme rose-pine]])
-- vim.cmd([[colorscheme poimandres]])
-- vim.cmd([[colorscheme oh-lucy-evening]])
-- vim.cmd([[colorscheme moonfly]])
-- vim.cmd([[colorscheme gruvbox]])

vim.g.snacks_animate = false
-- local opts = { silent = true, noremap = true }
vim.keymap.set("n", "<leader>sr", function()
	require("persistence").load()
end, { desc = "Restore Session" })

vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })

vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
