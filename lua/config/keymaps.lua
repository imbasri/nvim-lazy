-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<ESC>", { silent = true })
-- vim.keymap.set(
--     "n",
--     "<leader>sx",
--     require("telescope.builtin").resume,
--     { noremap = true, silent = true, desc = "Resume" }
-- )
--
--automatically comment with neogen
local opts = { noremap = true, silent = true, }
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
