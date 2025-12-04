return {
	default = {
		dir_path = "assets", ---@type string | fun(): string
		-- extension = "jxl", ---@type string | fun(): string
		extension = "png", ---@type string | fun(): string
		file_name = "%Y-%m-%d-%H-%M-%S", ---@type string | fun(): string
		use_absolute_path = false, ---@type boolean | fun(): boolean
		relative_to_current_file = true, ---@type boolean | fun(): boolean

		-- logging options
		verbose = true, ---@type boolean | fun(): boolean

		-- template options
		template = "$FILE_PATH", ---@type string | fun(context: table): string
		url_encode_path = false, ---@type boolean | fun(): boolean
		relative_template_path = true, ---@type boolean | fun(): boolean
		use_cursor_in_template = true, ---@type boolean | fun(): boolean
		insert_mode_after_paste = true, ---@type boolean | fun(): boolean
		insert_template_after_cursor = true, ---@type boolean | fun(): boolean

		-- prompt options
		prompt_for_file_name = false, ---@type boolean | fun(): boolean
		show_dir_path_in_prompt = false, ---@type boolean | fun(): boolean

		-- base64 options
		max_base64_size = 10, ---@type number | fun(): number
		embed_image_as_base64 = false, ---@type boolean | fun(): boolean

		-- image options
		-- process_cmd = "magick - jxl:-", ---@type string | fun(): string
		process_cmd = "magick - png:-", ---@type string | fun(): string
		copy_images = true, ---@type boolean | fun(): boolean
		download_images = true, ---@type boolean | fun(): boolean
		formats = { "jpeg", "jpg", "png", "jxl", "webp", "gif" }, ---@type string[]

		-- drag and drop options
		drag_and_drop = {
			enabled = true, ---@type boolean | fun(): boolean
			insert_mode = false, ---@type boolean | fun(): boolean
		},
	},
}
