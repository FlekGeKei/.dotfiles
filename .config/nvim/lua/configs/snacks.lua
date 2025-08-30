return {
	---@class snacks.image.Config
	image = {
		img_dirs = { "img", "images", "assets", "static", "public", "media", "attachments", "_attach" },
	},
	explorer = {
		replace_netrw = true,
	},
	picker = {
		sources = {
			explorer = {
				hidden = true,
				exclude = { ".mozilla", ".cache", ".floorp", ".rustup", ".cargo", ".gradle", ".thunderbird" },
			},
		},
	},
}
