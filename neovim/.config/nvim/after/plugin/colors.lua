function ColorUpdate(color)
	local new_color = color or "everblush"
	vim.cmd.colorscheme(new_color)
end

ColorUpdate()
