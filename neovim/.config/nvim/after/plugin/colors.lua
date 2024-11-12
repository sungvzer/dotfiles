function ColorUpdate(color)
	local new_color = color or "github_dark_dimmed"
	vim.cmd.colorscheme(new_color)
end

ColorUpdate()
