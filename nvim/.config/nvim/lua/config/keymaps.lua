-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

local opts = { silent = true, noremap = true }

-- Move current line / block up and down with Ctrl+Shift+j/k

map("n", "<C-S-j>", ":m .+1<CR>==", opts)

map("n", "<C-S-k>", ":m .-2<CR>==", opts)

map("i", "<C-S-j>", "<Esc>:m .+1<CR>==gi", opts)

map("i", "<C-S-k>", "<Esc>:m .-2<CR>==gi", opts)

map("v", "<C-S-j>", ":m '>+1<CR>gv=gv", opts)

map("v", "<C-S-k>", ":m '<-2<CR>gv=gv", opts)
