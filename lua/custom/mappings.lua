local M = {}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates"
    },
    ["<C-s>"] = { ":w<CR>", "save" },
    ["<A-j>"] = { ":m .+1<CR>==", "move lines down" },
    ["<A-k>"] = { ":m .-2<CR>==", "move lines up" },
    ["<leader>d"] = { "\"_d", "delete lines without copying" },
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
