local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = { "biome", "cssls", "gopls", "html", "ts_ls" }

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
            url = "https://gg.thepoy.cc/https://raw.githubusercontent.com/tauri-apps/tauri/dev/crates/tauri-cli/schema.json",
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
        url = "",
      },
      schemas = require("schemastore").yaml.schemas(),
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

lspconfig.pyright.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  single_file_support = true,
  before_init = function(_, config)
    local venv = vim.env.VENV_PATH

    if venv == nil then
      venv = vim.env.CONDA_PREFIX .. "/envs"
    end

    if venv ~= nil then
      config.settings.python.venvPath = venv
    else
      if vim.loop.os_uname().sysname ~= "Windows" then
        config.settings.python.pythonPath = vim.env.HOME .. "/miniconda3/bin/python"
      end
    end
  end,
}
