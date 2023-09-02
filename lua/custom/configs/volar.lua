local capabilities = require("plugins.configs.lspconfig").capabilities

local cwd = vim.fn.getcwd()
local util = require("lspconfig.util")
local project_root = util.find_node_modules_ancestor(cwd)
local vue_module = util.path.join(project_root, "node_modules", "vue")
local vue_is_installed = vim.fn.isdirectory(vue_module) == 1

local options = {
  -- on_attach = on_attach,
  capabilities = capabilities,
}

if vue_is_installed then
  options.filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
end

return options
