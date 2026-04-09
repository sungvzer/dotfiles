function ColorUpdate(color)
	local new_color = color or "kanagawa"
	vim.cmd.colorscheme(new_color)
end

ColorUpdate()
