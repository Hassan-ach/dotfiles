local black_metal_palette = {
	color0 = "#000000",
	color1 = "#5f8787",
	color2 = "#9b8d7f",
	color3 = "#8c7f70",
	color4 = "#888888",
	color5 = "#999999",
	color6 = "#aaaaaa",
	color7 = "#c1c1c1",
	color8 = "#333333",
	color9 = "#5f8787",
	color10 = "#9b8d7f",
	color11 = "#8c7f70",
	color12 = "#888888",
	color13 = "#999999",
	color14 = "#aaaaaa",
	color15 = "#c1c1c1",
	color16 = "#aaaaaa",
	color17 = "#444444",
	color18 = "#121212",
	color19 = "#222222",
	color20 = "#999999",
	color21 = "#999999",
}

-- Plugins
require("full-border"):setup({
	type = ui.Border.ROUNDED,
})

require("zoxide"):setup({
	update_db = true,
})

require("session"):setup({
	sync_yanked = true,
})

require("searchjump"):setup({
	unmatch_fg = black_metal_palette.color18,
	match_str_fg = black_metal_palette.color3,
	match_str_bg = black_metal_palette.color0,
	first_match_str_fg = black_metal_palette.color1,
	first_match_str_bg = black_metal_palette.color0,
	lable_fg = black_metal_palette.color2,
	lable_bg = black_metal_palette.color0,
	only_current = false,
	show_search_in_statusbar = false,
	auto_exit_when_unmatch = false,
	enable_capital_lable = false,
	search_patterns = {},
})

require("yatline"):setup({
	section_separator = { open = "", close = "" },
	inverse_separator = { open = "", close = "" },
	part_separator = { open = "", close = "" },

	style_a = {
		fg = black_metal_palette.color18,
		bg_mode = {
			normal = black_metal_palette.color4,
			select = black_metal_palette.color1,
			un_set = black_metal_palette.color17,
		},
	},
	style_b = { bg = black_metal_palette.color18, fg = black_metal_palette.color7 },
	style_c = { bg = black_metal_palette.color0, fg = black_metal_palette.color7 },

	permissions_t_fg = black_metal_palette.color2,
	permissions_r_fg = black_metal_palette.color3,
	permissions_w_fg = black_metal_palette.color17,
	permissions_x_fg = black_metal_palette.color5,
	permissions_s_fg = black_metal_palette.color1,

	selected = { icon = "󰻭", fg = black_metal_palette.color3 },
	copied = { icon = "", fg = black_metal_palette.color2 },
	cut = { icon = "", fg = black_metal_palette.color17 },

	total = { icon = "", fg = black_metal_palette.color3 },
	succ = { icon = "", fg = black_metal_palette.color2 },
	fail = { icon = "", fg = black_metal_palette.color17 },
	found = { icon = "", fg = black_metal_palette.color4 },
	processed = { icon = "", fg = black_metal_palette.color2 },

	tab_width = 20,
	tab_use_inverse = true,
	show_background = false,
	display_header_line = true,
	display_status_line = true,

	header_line = {
		left = {
			section_a = {
				{ type = "line", custom = false, name = "tabs", params = { "left" } },
			},
			section_b = {
				{ type = "coloreds", custom = false, name = "githead" },
			},
			section_c = {},
		},
		right = {
			section_a = {
				{ type = "string", custom = false, name = "tab_path" },
			},
			section_b = {
				{ type = "coloreds", custom = false, name = "task_workload" },
			},
			section_c = {
				{ type = "coloreds", custom = false, name = "task_states" },
			},
		},
	},

	status_line = {
		left = {
			section_a = {
				{ type = "string", custom = false, name = "tab_mode" },
			},
			section_b = {
				{ type = "string", custom = false, name = "hovered_size" },
			},
			section_c = {
				{ type = "string", custom = false, name = "hovered_name" },
				{ type = "coloreds", custom = false, name = "count" },
			},
		},
		right = {
			section_a = {
				{ type = "string", custom = false, name = "cursor_position" },
			},
			section_b = {
				{ type = "string", custom = false, name = "cursor_percentage" },
			},
			section_c = {
				{ type = "string", custom = false, name = "hovered_file_extension", params = { true } },
				{ type = "coloreds", custom = false, name = "permissions" },
			},
		},
	},
})

require("yatline-githead"):setup({
	show_branch = true,
	branch_prefix = "",
	branch_symbol = "",
	branch_borders = "",
	commit_symbol = " ",
	show_behind_ahead = true,
	behind_symbol = " ",
	ahead_symbol = " ",
	show_stashes = true,
	stashes_symbol = " ",
	show_state = true,
	show_state_prefix = true,
	state_symbol = "󱅉",
	show_staged = true,
	staged_symbol = " ",
	show_unstaged = true,
	unstaged_symbol = " ",
	show_untracked = true,
	untracked_symbol = " ",

	prefix_color = black_metal_palette.color5,
	branch_color = black_metal_palette.color1,
	commit_color = black_metal_palette.color4,
	stashes_color = black_metal_palette.color6,
	state_color = black_metal_palette.color7,
	staged_color = black_metal_palette.color2,
	unstaged_color = black_metal_palette.color3,
	untracked_color = black_metal_palette.color5,
	ahead_color = black_metal_palette.color2,
	behind_color = black_metal_palette.color3,
})

require("git"):setup()
