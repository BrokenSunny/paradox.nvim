local light = require("paradox.colors.light")
local dark = require("paradox.colors.dark")
local M = {}

function M.load()
  local bg = vim.o.background

  if bg == "light" then
    return light
  elseif bg == "dark" then
    return dark
  end
end

return M
