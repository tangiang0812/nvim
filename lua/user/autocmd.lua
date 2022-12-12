--vim.cmd([[
--	augroup vimrc_help
--	  autocmd!
--	  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
--	augroup END
--]])

--vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])

function _G.leave_snippet()
  if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
      and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require('luasnip').session.jump_active
  then
    require('luasnip').unlink_current()
  end
end

-- stop snippets when you leave to normal mode
vim.api.nvim_command([[
    autocmd ModeChanged * lua leave_snippet()
]])
