local langs = {
	"c",
	"cpp",
	"cmake",
	"comment",
	"go",
	"java",
	"javascript",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"rust",
	"typescript",
	"todotxt",
	"ron",
}

require("nvim-treesitter").install(langs)
require("nvim-treesitter").install("latex")

vim.filetype.add({
	filename = {
		["todo.txt"] = "todotxt",
	},
})

table.insert(langs, "plaintex")
table.insert(langs, "tex")

vim.api.nvim_create_autocmd("FileType", {
	pattern = langs,
	callback = function()
		vim.treesitter.start()
	end,
})
