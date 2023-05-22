local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local options = {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
      },
    },
  }
}

return options
