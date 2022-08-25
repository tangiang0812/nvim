local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup({
	options = {
		ignore_focus = { "NvimTree", }
	},
	always_devide_middle = true,
	sections = {
		lualine_b = {
			"branch",
			"diff",
			{
				"diagnostics",
				sources = {
					"nvim_lsp",
				},
				symbols = {
					error = " ",
					warn = " ",
					-- hint = "",
					info = " ",
					hint = " ",
				}
			}
		},
	},
	theme = "tokyonight"
})
