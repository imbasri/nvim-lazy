return {
        "rafamadriz/friendly-snippets",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load({
                exclude = { "cobol", "fortran","cpp","latex","ruby","kotlin" },
            })
        end,
}
