local options = {
  formatters_by_ft = {
    css = { { "prettierd", "prettier" } },
    html = { { "prettierd", "prettier" } },
    javascript = { "biome" },
    json = { "biome" },
    lua = { "stylua" },
    markdown = { { "prettierd", "prettier" } },
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
