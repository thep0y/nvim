local options = {
  formatters_by_ft = {
    css = { "prettierd", "prettier", stop_after_first = true },
    scss = { "prettierd", "prettier", stop_after_first = true },
    go = { "gofumpt", "goimports-reviser", "golines" },
    html = { "prettierd", "prettier", stop_after_first = true },
    javascript = { "biome" },
    json = { "biome" },
    lua = { "stylua" },
    markdown = { "prettierd", "prettier", stop_after_first = true },
    python = { "black" },
    rust = { "rustfmt" },
    toml = { "taplo" },
    typescript = { "biome" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
