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
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = function()
			return require("configs.img-clip")
		end,
		keys = {
			{ "<leader>ip", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		},
	},
	{
		"brenton-leighton/multiple-cursors.nvim",
		version = "*", -- Use the latest tagged version
		opts = {
			custom_key_maps = {
				{
					"n",
					"<Leader>\\",
					function()
						require("multiple-cursors").align()
					end,
				},
			},
		},
		keys = {
			{ "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" }, desc = "Add cursor and move down" },
			{ "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "x" }, desc = "Add cursor and move up" },
			{
				"<C-LeftMouse>",
				"<Cmd>MultipleCursorsMouseAddDelete<CR>",
				mode = { "n", "i" },
				desc = "Add or remove cursor on mouse click",
			},
			{
				"<C-Return>",
				"<Cmd>MultipleCursorsAddDelete<CR>",
				mode = { "n" },
				desc = "Add a locked cursor or remove an existing cursor",
			},
			{
				"<Leader>m",
				"<Cmd>MultipleCursorsAddVisualArea<CR>",
				mode = { "x" },
				desc = "Add cursors to the lines of the visual area",
			},

			{ "<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", mode = { "n", "x" }, desc = "Add cursors to cword" },
			{
				"<Leader>A",
				"<Cmd>MultipleCursorsAddMatchesV<CR>",
				mode = { "n", "x" },
				desc = "Add cursors to cword in previous area",
			},

			{
				"<Leader>d",
				"<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
				mode = { "n", "x" },
				desc = "Add cursor and jump to next cword",
			},
			{ "<Leader>D", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Jump to next cword" },

			{ "<Leader>l", "<Cmd>MultipleCursorsLock<CR>", mode = { "n", "x" }, desc = "Lock virtual cursors" },
		},
	},
}
