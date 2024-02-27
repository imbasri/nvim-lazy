return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "css",
      "html",
      "typescript",
      "javascript",
      html = {
        mode = "foreground",
      },
    })
  end,
}
