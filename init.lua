require("projects"):setup({
	last = {
		update_after_save = true,
		update_after_load = true,
		update_before_quit = true,
		load_after_start = false,
	},
	notify = {
		enable = true,
		title = "Projects",
		timeout = 2,
		level = "info",
	},
})
