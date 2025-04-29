require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { statusline = {}, winbar = {} },
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = { statusline = 200, tabline = 1000, winbar = 50 },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "diagnostics" },
		lualine_c = {},
		lualine_x = { "branch", "diff", "filetype" },
		lualine_y = { "encoding" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {
		lualine_a = { "filename" },
		lualine_b = {
			"navic",

			-- Component specific options
			color_correction = nil, -- Can be nil, "static" or "dynamic". This option is useful only when you have highlights enabled.
			-- Many colorschemes don't define same backgroud for nvim-navic as their lualine statusline backgroud.
			-- Setting it to "static" will perform a adjustment once when the component is being setup. This should
			--   be enough when the lualine section isn't changing colors based on the mode.
			-- Setting it to "dynamic" will keep updating the highlights according to the current modes colors for
			--   the current section.

			navic_opts = nil, -- lua table with same format as setup's option. All options except "lsp" options take effect when set here.
		},
	},
	inactive_winbar = {
		lualine_a = {
			"filename",
		},
	},
	extensions = {},
})
