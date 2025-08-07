local colors = {
	-- base = "#191724",
	-- surface = "#1f1d2e",
	-- overlay = "#26233a",
	-- muted = "#6e6a86",
	-- subtle = "#908caa",
	-- text = "#e0def4",
	-- love = "#eb6f92",
	-- gold = "#f6c177",
	-- rose = "#ebbcba",
	-- pine = "#31748f",
	-- foam = "#9ccfd8",
	-- iris = "#c4a7e7",
	-- highlight = "#f6c177",

	--The soft version of the color pallet
	base = "#232136", -- slightly lighter than #191724
	surface = "#2a273f", -- softer than #1f1d2e
	overlay = "#35334a", -- softer than #26233a
	muted = "#7e7aa6", -- lighter muted tone
	subtle = "#a29fcf", -- softer subtle
	text = "#e7e6f0", -- softer text
	love = "#ee8ca7", -- softer rose/pink
	gold = "#f8d49d", -- softer gold
	rose = "#efcfd1", -- soft rose
	pine = "#4ea1b7", -- softer pine/teal
	foam = "#afd8de", -- softer foam
	iris = "#cdb8f3", -- softer iris/purple
	highlight = "#f8d49d", -- same as gold
}

return {
	normal = {
		a = { bg = colors.iris, fg = colors.base, gui = "bold" },
		b = { bg = colors.surface, fg = colors.muted },
		c = { bg = colors.base, fg = colors.text },
	},
	insert = {
		a = { bg = colors.pine, fg = colors.base, gui = "bold" },
		b = { bg = colors.surface, fg = colors.muted },
		c = { bg = colors.base, fg = colors.text },
	},
	visual = {
		a = { bg = colors.rose, fg = colors.base, gui = "bold" },
		b = { bg = colors.surface, fg = colors.muted },
		c = { bg = colors.base, fg = colors.text },
	},
	replace = {
		a = { bg = colors.love, fg = colors.base, gui = "bold" },
		b = { bg = colors.surface, fg = colors.muted },
		c = { bg = colors.base, fg = colors.text },
	},
	command = {
		a = { bg = colors.gold, fg = colors.base, gui = "bold" },
		b = { bg = colors.surface, fg = colors.muted },
		c = { bg = colors.base, fg = colors.text },
	},
	inactive = {
		a = { bg = colors.overlay, fg = colors.muted, gui = "bold" },
		b = { bg = colors.overlay, fg = colors.muted },
		c = { bg = colors.overlay, fg = colors.muted },
	},
}
