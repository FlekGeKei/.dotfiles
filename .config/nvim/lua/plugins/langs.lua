return {
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
		"tarides/ocaml.nvim",
		lazy = true,
		ft = { "ocaml", "dune", "menhir", "reason", "ocamllex", "ocamlinterface" },
		config = function()
			return require("configs.ocaml")
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
		lazy = true,
		ft = "java",
	},
	{
		"OXY2DEV/markview.nvim",
		priority = 49,
		lazy = true,
		ft = { "markdown", "plaintex", "tex", "quarto", "rmd", "typst", "html" },
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
}
