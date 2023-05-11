function ColorUpdate(color)
	color = color or "everblush"
	vim.cmd.colorscheme(color)

	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

require('everblush').setup({
    transparent_background = true,
})

ColorUpdate()

