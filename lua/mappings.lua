require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "x", '"_x', { desc = "delete char without copying" })
map("n", "<A-j>", ":m .+1<CR>==", { desc = "move lines down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "move lines up" })
map("n", "<leader>d", '"_d', { desc = "delete lines without copying" })
map(
  "n",
  "<leader>o",
  ":lua vim.diagnostic.open_float()<CR>",
  { desc = "Show all diagnostics on current line in floating window" }
)
map(
  "n",
  "<leader>on",
  ":lua vim.diagnostic.goto_next()<CR>",
  { desc = "Show all diagnostics on current line in floating window" }
)
map(
  "n",
  "<leader>op",
  ":lua vim.diagnostic.goto_prev()<CR>",
  { desc = "Show all diagnostics on current line in floating window" }
)
map("n", "<leader>rcu", function()
  require("crates").upgrade_all_crates()
end, { desc = "update crates" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("i", "jk", "<ESC>")
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "move lines down" })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "move lines up" })

map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "move lines down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "move lines up" })

if vim.g.neovide then
  map("n", "<C-v>", '"+P') -- Paste normal mode
  map("v", "<C-v>", '"+P') -- Paste visual mode
  map("c", "<C-v>", "<C-R>+") -- Paste command mode
  map("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode
end
