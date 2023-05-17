local M = {}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates"
    },
    ["<leader>d"] = { "\"_d", "delete lines without copying" },
    ["<leader>o"] = { ":lua vim.diagnostic.open_float()<CR>", "Show all diagnostics on current line in floating window" },
    ["<leader>on"] = { ":lua vim.diagnostic.goto_next()<CR>", "Show all diagnostics on current line in floating window" },
    ["<leader>op"] = { ":lua vim.diagnostic.goto_prev()<CR>", "Show all diagnostics on current line in floating window" },
    ["<C-s>"] = { ":w<CR>", "save" },
    ["<A-j>"] = { ":m .+1<CR>==", "move lines down" },
    ["<A-k>"] = { ":m .-2<CR>==", "move lines up" },
    ["x"] = { "\"_x", "delete char without copying" },
  },
  i = {
    ["<C-s>"] = { "<Esc>:w<CR>a", "save" },
    ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", "move lines down" },
    ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", "move lines up" },
  },
  v = {
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", "move lines down" },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", "move lines up" },
  }
}

return M
