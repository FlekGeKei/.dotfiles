require("mkdnflow").setup({
	modules = {
		bib = false,
		buffers = true,
		conceal = true,
		cursor = true,
		folds = true,
		foldtext = true,
		links = true,
		lists = true,
		maps = true,
		paths = true,
		tables = true,
		yaml = false,
		cmp = true,
	},
	perspective = {
		priority = "current",
		fallback = "first",
	},
	mappings = {
		MkdnToggleToDo = { { "n", "v" }, "<M-Space>" },
		MkdnFoldSection = { "n", "<leader>sf" },
		MkdnUnfoldSection = { "n", "<leader>sF" },
	},
})
vim.api.nvim_create_autocmd("FileType", { pattern = "markdown", command = "set awa" })
