function ColorUpdate(color)
	local new_color = color or "everforest"
	vim.cmd.colorscheme(new_color)
end

ColorUpdate()
