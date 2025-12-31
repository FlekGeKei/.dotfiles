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
		ft = "rust",
	},
	{
		"mfussenegger/nvim-jdtls",
		lazy = true,
		ft = "java",
	},
	{
		"folke/neoconf.nvim",
	},
	{
		"OXY2DEV/markview.nvim",
		priority = 49,
		lazy = true,
		dependencies = {
			"saghen/blink.cmp",
			"ribru17/blink-cmp-spell",
		},
		opts = function()
			return require("configs.markview")
		end,
	},
	{
		"jakewvincent/mkdnflow.nvim",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"Saghen/blink.cmp",
			"Saghen/blink.compat",
		},
		config = function()
			require("configs.mkdnflow")
		end,
	},
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = function()
			return require("configs.img-clip")
		end,
		keys = {
			{ "<leader>ip", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
			{
				"<leader>pi",
				function()
					Snacks.picker.files({
						ft = { "jpg", "jpeg", "png", "webp", "gif", "jxl" },
						confirm = function(self, item, _)
							self:close()
							--require("img-clip").paste_image({ file_name = "%Y-%m-%d-%H-%M-%S.jxl" }, "./" .. item.file) -- ./ is necessary for img-clip to recognize it as path
							require("img-clip").paste_image({ file_name = "%Y-%m-%d-%H-%M-%S.png" }, "./" .. item.file) -- ./ is necessary for img-clip to recognize it as path
						end,
					})
				end,
				desc = "[P]ick [I]mage",
			},
		},
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = function()
			return require("configs.snacks")
		end,
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
			return require("configs.which-key")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("configs.lualine")
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
