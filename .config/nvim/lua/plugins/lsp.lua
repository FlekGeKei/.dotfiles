return {
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
		lazy = false,
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		dependencies = { "OXY2DEV/markview.nvim" },
		build = ":TSUpdate",
		opts = function()
			return require("configs.treesitter")
		end,
		config = function(opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			max_lines = 3,
			multiline_threshold = 1,
		},
	},
	{
		"mfussenegger/nvim-lint",
		opts = function()
			return require("configs.lint.opts")
		end,
		config = function(_, opts)
			require("configs.lint").setup(opts)
		end,
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"folke/lazydev.nvim",
			"saghen/blink.compat",
		},
		event = "InsertEnter",
		version = "*",
		opts = function()
			return require("configs.blinkcmp")
		end,
		opts_extend = {
			"sources.default",
		},
	},
	{
		"chrisgrieser/nvim-scissors",
		-- dependencies = "folke/snacks.nvim", -- either snacks, fzf-lua, telescope
		-- dependencies = "ibhagwan/fzf-lua",
		dependencies = "nvim-telescope/telescope.nvim",
		opts = {
			snippetDir = "~/.config/nvim/snippets/",
		},
	},
	{
		"saghen/blink.compat",
		-- use v2.* for blink.cmp v1.*
		version = "2.*",
		-- lazy.nvim will automatically load the plugin when it's required by blink.cmp
		lazy = true,
		-- make sure to set opts so that lazy.nvim calls blink.compat's setup
		opts = {},
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
