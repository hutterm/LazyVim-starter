-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keymap for pasting from system clipboard in command mode
vim.keymap.set({ "c", "i" }, "<c-v>", "<c-r>+", { noremap = true })
