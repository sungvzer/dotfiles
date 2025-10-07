function ColorUpdate(color)
	local new_color = color or "vague"
	vim.cmd.colorscheme(new_color)
end

ColorUpdate()
