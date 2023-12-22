local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local function get_venv_path()
  local venv = vim.env.VENV_PATH

  if venv == nil then
    venv = vim.env.CONDA_PREFIX .. '/envs'
  end

  return venv
end

local options = {
  single_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities,
  before_init = function(_, config)
    local venv_path = get_venv_path()
    if venv_path ~= nil then
      config.settings.python.venvPath = get_venv_path()
    else
      if vim.loop.os_uname().sysname ~= "Windows" then
        config.settings.python.pythonPath = vim.env.HOME .. "/miniconda3/bin/python"
      end
    end
  end,
}

return options
