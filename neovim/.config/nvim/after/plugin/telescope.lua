local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", ':lua require"telescope.builtin".find_files({ hidden = true })<CR>', {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
vim.keymap.set("n", "<leader>pt", builtin.lsp_dynamic_workspace_symbols, {})
local actions = require("telescope.actions")

require("telescope").setup({
	pickers = {
		colorscheme = {
			enable_preview = true,
		},
	},
	defaults = {
		file_ignore_patterns = {
			".*.git/",
		},
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
	},
})
