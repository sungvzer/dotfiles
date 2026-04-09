return {
	{ "mfussenegger/nvim-lint" },
	{ "github/copilot.vim" },
	{ "nvim-telescope/telescope.nvim", branch = "master", dependencies = { "nvim-lua/plenary.nvim" } },

	{
		"romus204/tree-sitter-manager.nvim",
		dependencies = {}, -- tree-sitter CLI must be installed system-wide
		config = function()
			require("tree-sitter-manager").setup({
				-- ensure_installed = { "bash", "lua", "python" }, -- list of parsers to install automatically
				-- Optional: custom paths
				-- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
				-- query_dir = vim.fn.stdpath("data") .. "/site/queries",
			})
		end,
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
	{ "hrsh7th/nvim-cmp" },
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
