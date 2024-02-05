local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  sources = {
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.prettierd.with {
      extra_filetypes = { "svg", "toml" },
    },
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.sql_formatter,
    null_ls.builtins.formatting.taplo,
    null_ls.builtins.diagnostics.todo_comments,
  },
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
}

return opts
