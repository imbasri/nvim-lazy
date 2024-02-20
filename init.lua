-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local api = vim.api
api.nvim_set_hl(0, "LineNr", { fg = "#ffffff", bg = "none", bold = true })
api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC", bold = false })
api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F", bold = false })
api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bg = "none", bold = true })
-- api.nvim_set_hl(0, 'CursorLine', { underline = true })
api.nvim_set_hl(0, "Visual", { bg = "#000000" })
api.nvim_set_hl(0, "NotifyBackground", { bg = "#ffffff" })
api.nvim_set_hl(0, "folded", { fg = "#ff6347", bg = "#000000" })
