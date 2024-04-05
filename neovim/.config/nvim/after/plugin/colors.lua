function ColorUpdate(color)
	local new_color = color or "kanagawa-wave"
	vim.cmd.colorscheme(new_color)
end

ColorUpdate()
