local options = {
  ensure_installed = { "lua" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },

  autotag = {
    enable = true,
    filetypes = { 'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'markdown' },
  },
}

return options
