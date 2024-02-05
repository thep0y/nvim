require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)

if vim.loop.os_uname().sysname == "Linux" then
  vim.opt.clipboard = "unnamedplus" -- linux 上与系统剪贴板通信
end

require "plugins"

if vim.g.neovide then
  vim.o.guifont = "Monaco Nerd Font:h16"
  vim.g.neovide_input_macos_alt_is_meta = true
end
