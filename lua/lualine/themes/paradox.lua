local M = {}
local colors = require("paradox.colors").load()

M.normal = {
  a = { fg = colors.bg1, bg = colors.hue52, gui = "bold" },
  b = { fg = colors.hue52, bg = colors.bg4 },
  c = { fg = colors.fg, bg = colors.active },
}

M.insert = {
  a = { fg = colors.bg1, bg = colors.hue20, gui = "bold" },
  b = { fg = colors.hue20, bg = colors.bg4 },
}

M.command = {
  a = { fg = colors.bg1, bg = colors.hue36, gui = "bold" },
  b = { fg = colors.hue36, bg = colors.bg4 },
}

M.visual = {
  a = { fg = colors.bg1, bg = colors.hue12, gui = "bold" },
  b = { fg = colors.hue12, bg = colors.bg4 },
}

M.replace = {
  a = { fg = colors.bg1, bg = colors.hue1, gui = "bold" },
  b = { fg = colors.hue1, bg = colors.bg4 },
}

M.inactive = {
  a = { fg = colors.bg10, bg = colors.floating, gui = "bold" },
  b = { fg = colors.light_gray, bg = colors.floating },
  c = { fg = colors.light_gray, bg = colors.active },
}

return M
