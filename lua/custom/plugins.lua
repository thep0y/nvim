local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "lua-language-server",
        "pyright",
        "gopls",
        "typescript-language-server",
        "vue-language-server",
        "yaml-language-server",
        "json-lsp",
        "eslint-lsp",
        "stylelint",
        "stylelint-lsp",
        "bash-language-server",
        "black",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "powershell-editor-services",
        "css-lsp",
        "prettier",
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    ft = { "typescript", "vue" },
    dependencies = "neovim/nvim-lspconfig",
    config = function(_, opts)
      require("typescript").setup({
        disable_commands = false, -- prevent the plugin from creating Vim commands
        debug = false,            -- enable debug logging for commands
        go_to_source_definition = {
          fallback = true,        -- fall back to standard LSP definition on failure
        },
        server = opts,            -- pass options to lspconfig's setup method
      })
    end
  },
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require("plugins.configs.cmp")
      table.insert(M.sources, { name = 'crates' })
      return M
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "go", "python", "scss" },
    opts = function()
      return require("custom.configs.null-ls")
    end,
    --config = function()
    --    require("null-ls").setup()
    --end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd([[silent! GoInstallDeps]])
    end
  },
}

return plugins
