-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.api.nvim_exec("language en_US", true)
-- vim.opt.shell = 'pwsh'
vim.opt.shell = vim.fn.executable("pwsh") and "pwsh" or "powershell"
vim.opt.shellcmdflag =
  "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""

vim.opt.spelllang = "en_us,de_de"
-- vim.g.python3_host_prog = ""
--
--
--
if vim.g.neovide then
  vim.o.guifont = "JetBrains_Mono,Iosevka_Nerd_Font:h12"
end
