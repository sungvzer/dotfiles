function ColorUpdate(color)
	local new_color = color or "github_dark"
	vim.cmd.colorscheme(new_color)
	-- If Terminal is KITTY, or inside TMUX with KITTY, set background to transparent
	if os.getenv("TERM") == "xterm-kitty" or os.getenv("KITTY_WINDOW_ID") ~= nil then
		vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
		vim.cmd([[hi NormalNC guibg=NONE ctermbg=NONE]])
		vim.cmd([[hi SignColumn guibg=NONE ctermbg=NONE]])

		-- Telescope popup transparency
		vim.cmd([[hi TelescopeNormal guibg=NONE ctermbg=NONE]])

		-- NvimTree transparency
		vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])
	end
end

ColorUpdate()
