local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local function get_venv_path()
  assert(vim.env.VENV_PATH ~= nil, "pyright 需要配置 VENV_PATH 环境变量")

  return vim.env.VENV_PATH
end

local options = {
  single_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities,
  before_init = function(_, config)
    config.settings.python.venvPath = get_venv_path()
  end,
}

return options
