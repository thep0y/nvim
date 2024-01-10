local capabilities = require("plugins.configs.lspconfig").capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local options = {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas {
        extra = {
          {
            description = "Tauri Config",
            fileMatch = { "tauri.conf.json" },
            name = "tauri.conf.json",
            -- url = "https://gg.thepoy.cc/https://raw.githubusercontent.com/tauri-apps/tauri/dev/tooling/cli/schema.json",
            url = "https://raw.nuaa.cf/tauri-apps/tauri/dev/tooling/cli/schema.json",
          },
        },
      },
      validate = { enable = true },
    },
  },
  single_file_support = true,
}

return options
