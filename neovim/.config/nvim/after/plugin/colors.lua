function ColorUpdate(color)
	local new_color = color or "tender"
	vim.cmd.colorscheme(new_color)
end

ColorUpdate()
