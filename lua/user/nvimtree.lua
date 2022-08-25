local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvimtree.setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
	},
	renderer = {
		indent_markers = {
			enable = true,
		}
	},
	view = {
		width = 30,
		height = 30,
		side = "left",
		--    mappings = {
		--      list = {
		--        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
		--        { key = "h", cb = tree_cb "close_node" },
		--        { key = "v", cb = tree_cb "vsplit" },
		--      },
		--    },
	},
})
