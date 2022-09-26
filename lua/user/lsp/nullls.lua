local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local on_attach = require("user.lsp.handlers").on_attach

null_ls.setup({
	debug = false,
	sources = {
		--[[ null_ls.builtins.formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }), ]]
		--[[ null_ls.builtins.formatting.stylua, ]]
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.black,
		--[[ null_ls.builtins.diagnostics.mypy, ]]
	},
	on_attach = on_attach
})
