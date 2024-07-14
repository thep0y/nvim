return {

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "biome",
        "black",
        "css-lsp",
        -- "docker-compose-language-service",
        -- "dockerfile-language-server",
        -- "graphql-language-service-cli",
        "gopls",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "prettierd", -- 格式化 markdown、html
        "pyright",
        "stylua",
        "taplo", -- toml
        "typescript-language-server",
        "yaml-language-server",
      },
      github = {
        download_url_template = "https://gg.thepoy.cc/https://github.com/%s/releases/download/%s/%s",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "csv",
        "diff",
        "dockerfile",
        "git_config",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "graphql",
        "html",
        "ini",
        "javascript",
        "json",
        "lua",
        "markdown",
        "python",
        "rust",
        "scss",
        "sql",
        "ssh_config",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "vue",
        "xml",
        "yaml",
      },
      auto_install = true,
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "dist",
          "target",
          ".git",
          "gen",
          "lock",
          "%.png",
          "%.avif",
          "%.ico",
          "%.icns",
          "%.svg",
        },
      },
    },
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    lazy = false, -- This plugin is already lazy
    init = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            local oa = require("nvchad.configs.lspconfig").on_attach
            oa(client, bufnr)
          end,
          capabilities = capabilities,
          default_settings = {
            ["rust-analyzer"] = {
              files = {
                excludeDirs = { "target", "gen" },
              },
            },
          },
        },
      }
    end,
  },

  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    tag = "stable",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "vue",
      "tsx",
      "jsx",
      "xml",
      "markdown",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  { "b0o/schemastore.nvim" },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = {
      "bash",
      "css",
      "go",
      "javascript",
      "javascriptreact",
      "jsx",
      "lua",
      "python",
      "rust",
      "scss",
      "tsx",
      "typescript",
      "typescriptreact",
      "vue",
    },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
