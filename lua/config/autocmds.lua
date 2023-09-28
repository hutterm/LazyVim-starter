-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  command = "setlocal noet ci pi sts=0 sw=4 ts=4",
  -- callback = function()
  --   vim.opt_local.noexpandtab = true
  --   vim.opt_local.copyindent = true
  --   vim.opt_local.preserveindent = true
  --   vim.opt_local.softtabstop = 0
  --   vim.opt_local.shiftwidth = 4
  --   vim.opt_local.tabstop = 4
  -- end,
})
