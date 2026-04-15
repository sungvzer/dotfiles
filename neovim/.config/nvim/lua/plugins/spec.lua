return {
	{ "folke/zen-mode.nvim" },
	{
		"folke/twilight.nvim",
	},
	{ "mfussenegger/nvim-lint" },
	{ "github/copilot.vim" },
	{ "nvim-telescope/telescope.nvim", branch = "master", dependencies = { "nvim-lua/plenary.nvim" } },

	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		init = function()
			vim.g.loaded_nvim_treesitter = 1
		end,
	},

	{
		"lewis6991/ts-install.nvim",
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"SmiteshP/nvim-navbuddy",
				dependencies = {
					"SmiteshP/nvim-navic",
					"neovim/nvim-lspconfig",
					"MunifTanjim/nui.nvim",
					"numToStr/Comment.nvim",
					"nvim-telescope/telescope.nvim",
				},
				opts = { lsp = { auto_attach = true } },
			},
		},
	},
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"hrsh7th/nvim-cmp",
		-- 2026-04-09: Latest commit would be a1d504892f2bc56c2e79b65c6faded2fd21f3eca but it crashes due to some nil shit. IDK I'm too tired for this.
		-- Will probably check next time I look at this file if it is fixed.
		commit = "da88697d7f45d16852c6b2769dc52387d1ddc45f",
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "L3MON4D3/LuaSnip" },
	{ "ray-x/lsp_signature.nvim" },

	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{ "sbdchd/neoformat" },
	{ "mhinz/vim-signify" },

	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "nvim-lua/plenary.nvim" },
	{
		"alexghergh/nvim-tmux-navigation",
		opts = {
			disable_when_zoomed = true, -- defaults to false
			keybindings = {
				left = "<C-h>",
				down = "<C-j>",
				up = "<C-k>",
				right = "<C-l>",
				last_active = "<C-\\>",
				next = "<C-Space>",
			},
		},
	},
	{ "folke/which-key.nvim" },
	{ "windwp/nvim-ts-autotag" },
	{ "lervag/vimtex" },
	{ "MunifTanjim/nui.nvim" },
	{
		"SmiteshP/nvim-navic",
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {
			lsp = {
				auto_attach = true,
			},
		},
	},
}
