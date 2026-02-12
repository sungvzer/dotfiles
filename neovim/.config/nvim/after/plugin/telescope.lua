local builtin = require("telescope.builtin")

local function find_files()
	builtin.find_files({ hidden = true, no_ignore = false })
end

vim.keymap.set("n", "<leader>pf", find_files, { desc = "Find files" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find git files" })
vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>pt", builtin.lsp_dynamic_workspace_symbols, { desc = "Workspace symbols" })
local actions = require("telescope.actions")

require("telescope").setup({
	pickers = {
		colorscheme = {
			enable_preview = true,
		},
	},
	defaults = {
		--	vimgrep_arguments = {
		--		{
		--			"rg",
		--			"--color=never",
		--			"--no-heading",
		--			"--with-filename",
		--			"--line-number",
		--			"--column",
		--			"--smart-case",
		--			"--hidden",
		--		},
		--	},
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
