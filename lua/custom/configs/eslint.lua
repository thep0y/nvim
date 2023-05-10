local capabilities = require("plugins.configs.lspconfig").capabilities

local options = {
  on_attach = function (_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
  capabilities = capabilities,
}

return options
