-- set color scheme
local colorscheme = "tokyonight-moon"

-- throw message if colorscheme not found instead of error out
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found")
	return
end


