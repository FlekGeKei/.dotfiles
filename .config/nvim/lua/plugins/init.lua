return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("configs.catppuccin")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsigns")
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		config = function()
			require("configs.conform")
		end,
	},
	{
		"mason-org/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		config = function()
			return require("configs.mason")
		end,
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		lazy = false,
	},
	{
		"folke/neoconf.nvim",
	},
	{
		"OXY2DEV/markview.nvim",
		priority = 49,
		dependencies = { "OXY2DEV/markview.nvim" },
		opts = {
			experimental = {
				check_rtp = false,
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require("configs.telescope")
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		opts = function()
			require("configs.which-key")
		end,
	},
  {
    'nvim-lualine/lualine.nvim',
    config = function ()
      require('configs.lualine')
    end
  },

	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			return require("configs.treesitter")
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"folke/lazydev.nvim",
		},
		version = "1.*",
		opts = function()
			require("configs.blinkcmp")
		end,
		opts_extend = { "sources.default" },
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			require("configs.lspconfig")
		end,
	},
}
