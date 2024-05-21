return {

	"mbbill/undotree",
	name = "undo-tree-vim",
	config = function()
		vim.cmd([[
        if has("persistent_undo")
           let target_path = expand('~/.undodir')
            " create the directory and any parent directories
            " if the location does not exist.
            if !isdirectory(target_path)
                call mkdir(target_path, "p", 0700)
            endif
            let &undodir=target_path
            set undofile
        endif
        ]])
		vim.keymap.set("n", "<leader>uh", ":UndotreeToggle<CR>", { noremap = true, silent = true })
	end,
}
