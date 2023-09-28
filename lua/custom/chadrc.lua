---@type ChadrcConfig
local M = {}
M.ui = {
  theme_toggle = { "ayu_dark", "ayu_light" },
  theme = "ayu_light",
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
