vim.cmd([[
	augroup vimrc_help
	  autocmd!
	  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
	augroup END
]])
