require("ts-install").setup({
	-- Automatically install missing parsers when entering buffer
	auto_install = true,
})

-- Create an autocommand group to prevent duplicate execution if the file is re-sourced
local ts_group = vim.api.nvim_create_augroup("AutoTreesitterStart", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = ts_group,
	pattern = "*",
	callback = function()
		-- Attempt to start treesitter; silently fail if no parser is installed
		pcall(vim.treesitter.start)
	end,
})
