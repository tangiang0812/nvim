--vim.cmd([[
--	augroup vimrc_help
--	  autocmd!
--	  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
--	augroup END
--]])

--vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting_sync()' ]])
