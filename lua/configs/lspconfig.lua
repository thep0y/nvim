local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = { "biome", "cssls", "gopls", "html", "pyright", "tsserver" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    single_file_support = true,
  }
end

lspconfig.jsonls.setup {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas {
        extra = {
          {
            description = "Tauri Config",
            fileMatch = { "tauri.conf.json" },
            name = "tauri.conf.json",
            url = "https://gg.thepoy.cc/https://raw.githubusercontent.com/tauri-apps/tauri/dev/tooling/cli/schema.json",
          },
        },
      },
      validate = { enable = true },
    },
  },
  single_file_support = true,
}

lspconfig.yamlls.setup {
  single_file_support = true,
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
      },
      schemas = require("schemastore").json.schemas(),
    },
  },
}

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}
