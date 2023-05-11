local M = {}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates"
    },
    ["<C-s>"] = { ":w<CR>", "save" }
  },
  i = {
    ["<C-s>"] = { "<Esc>:w<CR>a", "save" }
  }
}

return M
