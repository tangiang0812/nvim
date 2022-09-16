local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

null_ls.setup({
	debug = false,
	sources = {
		--[[ null_ls.builtins.formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }), ]]
		--[[ null_ls.builtins.formatting.stylua, ]]
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.black,
		--[[ null_ls.builtins.diagnostics.mypy, ]]
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.api.nvim_command([[augroup Format]])
			vim.api.nvim_command([[autocmd! * <buffer>]])
			vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]])
			vim.api.nvim_command([[augroup END]])
		end
	end,
})
