function ColorUpdate(color)
	local new_color = color or "kanagawa-dragon"
	vim.cmd.colorscheme(new_color)
end

ColorUpdate()
