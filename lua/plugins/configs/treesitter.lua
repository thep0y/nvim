local options = {
  ensure_installed = {
    "lua",
    "python",
    "rust",
    "javascript",
    "typescript",
    "tsx",
    "sql",
    "yaml",
    "toml",
    "json",
    "markdown",
    "vue",
    "html",
    "go",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },

  -- autotag = {
  --   enable = true,
  --   filetypes = { 'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'markdown' },
  -- },
}

return options
