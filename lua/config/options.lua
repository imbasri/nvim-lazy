-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.winbar = "%=%m %f"
opt.shell = "powershell.exe"
opt.updatetime = 300 -- faster completion
opt.hidden = true
vim.g.border_style = "rounded"
-- set shell=powershell.exe  set terminal default
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Enable auto format
vim.g.autoformat = false
--general
opt.title = true
opt.confirm = true
opt.autowrite = true -- new
opt.path:append({ "**" }) -- Finding files - Search down into subfolders
opt.wildoptions = "pum"
opt.wildmode = "longest:full,full"
opt.completeopt = "menu,menuone,noselect"
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"
opt.formatoptions = "jcroqlnt" -- tcqj
opt.scrolloff = 7
opt.sidescrolloff = 8
opt.syntax = "on"
-- split
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen" -- new
-- display
opt.wrap = false
opt.termguicolors = true
opt.signcolumn = "yes"
opt.smartcase = true
opt.ignorecase = true
opt.smartindent = true
opt.smarttab = true
opt.virtualedit = "block" -- new
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.backspace = { "start", "eol", "indent" }
opt.wildignore:append({ "*/node_modules/*" })
-- jika ingin bisa menggunakan mouse maka ubah value mouse menjadi "a"
opt.mouse = ""
-- opt.list = true -- new
opt.fillchars = {
    eob = " ",
    fold = " ",
    foldsep = " ",
    foldopen = "",
    foldclose = "",
}

-- fold
opt.foldlevel = 99
opt.foldcolumn = "auto"
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
-- status
opt.laststatus = 2 -- 3
opt.showcmd = true
opt.showmode = false
opt.clipboard = "unnamedplus"
opt.cursorline = true
-- opt.cursorlineopt = require("mvim.config").transparent and "number" or "number,line"
-- indent opt.expandtab = true
opt.shiftround = true
opt.shiftwidth = 2
opt.tabstop = 2 -- new
opt.pumblend = 10
opt.pumheight = 10
opt.winminwidth = 5 -- new
opt.relativenumber = true
opt.number = true
-- time
opt.timeoutlen = 300 -- 500
opt.updatetime = 200 -- 500
-- undo
opt.undofile = true
-- Coding
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencodings = { "utf-8", "gbk", "gb2312" }


opt.spell = false -- disable spell checking
opt.spelllang = "en" -- language for spell checking

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end
