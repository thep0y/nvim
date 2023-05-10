local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local servers = { "pyright", "gopls", "tsserver" }


for _, lsp in ipairs(servers) do
  local opts = require("custom.configs." .. lsp)
  lspconfig[lsp].setup(opts)
end
