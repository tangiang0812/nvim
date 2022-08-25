local colorscheme = "tokyonight"
vim.g.tokyonight_lualine_bold = true
--[[ vim.g.tokyonight_transparent = true ]]
--[[ vim.g.tokyonight_transparent_sidebar = true ]]

local status_ok2, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok2 then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
