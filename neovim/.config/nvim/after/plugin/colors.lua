function ColorUpdate(color)
	local new_color = color or "ember-soft"
	vim.cmd.colorscheme(new_color)
end

ColorUpdate()
