require("flutter-tools").setup({})

vim.keymap.set(
	{ "n" },
	"<leader>fl",
	":vsplit | buffer __FLUTTER_DEV_LOG__<CR>",
	{ remap = false, desc = "Open flutter dev log in vertical split" }
)
