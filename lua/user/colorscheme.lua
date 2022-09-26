local colorscheme = "tokyonight"

local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
	return
end

tokyonight.setup({
	transparent = true,
	styles = {
		sidebars = "transparent",
		floats = "transparent"
	},
	lualine_bold = true,
})

local status_ok2, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok2 then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
