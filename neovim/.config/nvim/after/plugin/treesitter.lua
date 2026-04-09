local treesitter = require("nvim-treesitter")

treesitter.setup({
	highlight = {
		enable = true,
		disable = { "latex" },
	},

	indent = {
		enable = false,
	},
})

require("ts-install").setup({
	ensure_install = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "rust", "go", "jsx", "tsx" },

	-- List of parsers to ignore installing
	ignore_install = {},

	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	-- Directory to install parsers and queries to
	install_dir = vim.fn.stdpath("data") .. "/ts-install",
})
