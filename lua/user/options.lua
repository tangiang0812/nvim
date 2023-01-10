-- :help options

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.numberwidth = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.cursorline = true
--[[ vim.opt.cmdheight = 2 ]]
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.list = true
vim.opt.wrap = false
vim.opt.autoindent = true
vim.opt.smartindent = false
vim.opt.completeopt = {"noselect"}
vim.opt.wildmenu = false
--[[ vim.opt.wildchar = ('a'):byte() ]]
vim.opt.wildchar = 0
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--[[ vim.opt.listchars:append "eol:↴" ]]
--[[ vim.opt.listchars:append "tab:│ " ]]

-- neovide

if (vim.g.neovide)
then
  vim.g.neovide_transparency = 0.85
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_scroll_animation_length = 1
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
  vim.g.neovide_cursor_vfx_particle_density = 8.0
  vim.g.neovide_cursor_vfx_particle_phase = 1.5
  --[[ vim.g.neovide_cursor_vfx_particle_curl = 2.0 ]]
  vim.opt.guifont = { "JetBrainsMono Nerd Font:h7" }
end
