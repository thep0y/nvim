-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme_toggle = { "ayu_dark", "ayu_light" },
  theme = "ayu_light",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.ui = {}

M.mason = {
  cmd = true,
  pkgs = {
    "biome",
    "black",
    "css-lsp",
    -- "docker-compose-language-service",
    -- "dockerfile-language-server",
    -- "graphql-language-service-cli",
    "gopls",
    "html-lsp",
    "json-lsp",
    "lua-language-server",
    "prettierd", -- 格式化 markdown、html
    "pyright",
    "stylua",
    "taplo", -- toml
    "typescript-language-server",
    "yaml-language-server",
  },
}

return M
