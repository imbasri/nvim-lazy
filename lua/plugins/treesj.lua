return {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("treesj").setup(
            {--[[ your config ]]
            use_default_keymaps = true,
            max_join_length = 300,
            check_syntax_errors = true,
            on_error = nil,
        })
    end,
}
