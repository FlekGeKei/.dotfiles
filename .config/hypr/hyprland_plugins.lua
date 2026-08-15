local colors = require("mocha")

local function rgba(color, alpha)
	return "rgba(" .. color .. alpha .. ")"
end

if hl.plugin.dynamic_cursors then
	hl.config({ plugin = { dynamic_cursors = {
		shake = {
			enabled = false,
		},
	} } })
end

if hl.plugin.gloview then
	hl.gesture({ fingers = 4, direction = "up", action = hl.plugin.gloview.open })
	hl.gesture({ fingers = 4, direction = "down", action = hl.plugin.gloview.close })
	hl.gesture({ fingers = 4, direction = "right", action = hl.plugin.gloview.next })
	hl.gesture({ fingers = 4, direction = "left", action = hl.plugin.gloview.prev })

	hl.config({
		plugin = {
			gloview = {
				layout = "natural",

				duration = 200,
				switch_duration = 200,

				preview_round = 2,
				strip_card_round = 2,

				strip_active_border_size = 2,
				strip_hover_border_size = 2,
				hover_border_size = 1,
				select_border_size = 1,

				strip_active_border = colors.red,
				strip_hover_border = colors.red,
				hover_border = colors.red,
				select_border = colors.red,

				backdrop_color = rgba(colors.crustAlpha, "E6"),
				strip_band_color = rgba(colors.mantleAlpha, "CC"),
				strip_card_color = rgba(colors.surface0Alpha, "DD"),
				preview_bg = rgba(colors.baseAlpha, "FF"),
				shadow_color = rgba(colors.surface2Alpha, "EE"),
			},
		},
	})
end
