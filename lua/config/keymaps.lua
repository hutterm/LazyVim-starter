-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keymap for pasting from system clipboard in command mode
vim.keymap.set({ "c", "i" }, "<c-v>", "<c-r>+", { noremap = true })

-- Keymap for pasting without overwriting the clipboard
vim.keymap.set("x", "p", "P", { noremap = true })

-- Keymap for escaping the terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
