local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local options = {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    stylelintplus = {
      autoFixOnSave = true,
    },
  },
  filetypes = { "css", "less", "scss", "vue" },
}

return options
