local colorscheme = "tokyonight"

local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
  return
end

tokyonight.setup({
  --[[ transparent = true, ]]
  transparent = not vim.g.neovide and true or false,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    sidebars = "transparent",
    floats = "transparent"
  },
  lualine_bold = true,
  on_highlights = function(highlights, colors)
    highlights.LineNr = {
      fg = colors.blue
    }
    highlights.CursorLineNr = {
      fg = colors.orange,
      bold = true
    }
    highlights.NvimTreeIndentMarker = {
      fg = colors.blue,
      bold = true
    }
  end,
})

local status_ok2, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok2 then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
