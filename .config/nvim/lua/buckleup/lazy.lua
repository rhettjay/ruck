vim.loader.enable()
require("buckleup.opt")

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  }
end
vim.opt.rtp:prepend(lazypath)

require("buckleup.remap")
require("buckleup.cmd")

require("lazy").setup({
  spec = "buckleup.plugins",
  change_detection = {
    notify = false,
  },
})
