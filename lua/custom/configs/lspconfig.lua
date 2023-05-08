local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local servers = { "html", "cssls", "clangd", "pyright", "gopls" }


for _, lsp in ipairs(servers) do
  if lsp == 'pyright' then
    local opts = require("custom.configs.pyright")
    lspconfig[lsp].setup(opts)
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end
