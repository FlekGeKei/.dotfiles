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
}
