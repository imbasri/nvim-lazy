-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = Util.safe_keymap_set

vim.keymap.set("i", "jj", "<ESC>", { silent = true })
-- vim.keymap.set(
--     "n",
--     "<leader>sx",
--     require("telescope.builtin").resume,
--     { noremap = true, silent = true, desc = "Resume" }
-- )
--automatically comment with neogen
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)

-- Autocommands
vim.api.nvim_create_augroup("custom_buffer", { clear = true })

-- Select all
vim.keymap.set("n", "==", "gg<S-v>G")

--codeium
-- Change '<C-g>' here to any keycode you like.
vim.keymap.set("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-;>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-,>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Bookmarks
local bm = require("bookmarks")
map("n", "mm", bm.bookmark_toggle, { desc = "Toggle Bookmark" }) -- add or remove bookmark at current line
map("n", "mc", bm.bookmark_clean, { desc = "Clean All Marks" }) -- clean all marks in local buffer
map("n", "mn", bm.bookmark_next, { desc = "Next Mark" }) -- jump to next mark in local buffer
map("n", "mp", bm.bookmark_prev, { desc = "Previous Mark" }) -- jump to previous mark in local buffer
map("n", "ml", bm.bookmark_list, { desc = "Show Mark List" }) -- show marked file list in quickfix window
map("n", "mi", bm.bookmark_ann, { desc = "Bookmark @w=warn|@n=note|@t=todo|@f=fix" }) -- add or edit mark annotation at current line
