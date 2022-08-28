local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = "all", -- one of "all" or a list of languages
	--sync_install = true,
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		-- disable = { "css" },  list of languages that will be disabled
		-- additional_vim_regex_highlighting = true
	},
	--[[ autopairs = { ]]
	--[[ 	enable = true, ]]
	--[[ }, ]]
	autotag = {
		enable = true,
	},
	indent = { enable = false }, -- { disable = { ... } } list of languages what will be disabled
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	}
})
