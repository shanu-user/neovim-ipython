-- Ensure Lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- Latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set up Lazy.nvim and load plugins
require("lazy").setup({
  spec = {
    -- Import LazyVim's default configuration
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins" }, -- Your custom plugin configurations
  },
  defaults = { lazy = true },
})
