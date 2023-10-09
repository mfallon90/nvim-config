
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	vim.notify("Telescope not installed")
	return
end

local actions = require "telescope.actions"

telescope.setup {
	defaults = {
		
		path_display = {"smart"},
		mappings = {
			i = {
				["<Esc>"] = actions.close,
			},
		},
	},
}
