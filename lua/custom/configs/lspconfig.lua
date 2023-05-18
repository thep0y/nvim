local lspconfig = require("lspconfig")

local servers = { "pyright", "gopls", "tsserver", "volar", "eslint", "stylelint_lsp", "bashls", "jsonls",
  "cssls" }


for _, lsp in ipairs(servers) do
  local opts = require("custom.configs." .. lsp)
  lspconfig[lsp].setup(opts)
end
