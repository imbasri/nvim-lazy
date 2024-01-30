return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                    },
                },
                navic = { enabled = true, custom_bg = "lualine" },
                transparent_background = true, -- disables setting the background color.
                show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
                term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
                dim_inactive = {
                    enabled = false, -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15, -- percentage of the shade to apply to the inactive window
                },
                no_italic = false, -- Force no italic
                no_bold = false, -- Force no bold
                no_underline = false, -- Force no underline
                styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = { "italic" }, -- Change the style of comments
                    conditionals = { "italic" },
                    loops = {},
                    functions = { "bold" },
                    keywords = {},
                    strings = {},
                    variables = { "bold" },
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                },
                neotest = true,
                neotree = true,
                noice = true,
                notify = true,
                semantic_tokens = true,
                telescope = true,
                treesitter = true,
                treesitter_context = true,
                which_key = true,
                color_overrides = {},
                -- custom_highlights = function(colors)
                --     return {
                --         Comment = { fg = colors.flamingo },
                --         TabLineSel = { bg = colors.pink },
                --         CmpBorder = { fg = colors.surface2 },
                --         Pmenu = { bg = colors.none },
                --     }
                -- end,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = false,
                    mini = {
                        enabled = false,
                        indentscope_color = "",
                    },
                },
            })
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },
}

-- return {
--     -- add gruvbox
--     {
--         "ellisonleao/gruvbox.nvim",
--         priority = 1000,
--         config = true,
--         opts = {
--             terminal_colors = true, -- add neovim terminal colors
--             undercurl = true,
--             underline = true,
--             bold = true,
--             italic = {
--                 strings = true,
--                 emphasis = true,
--                 comments = true,
--                 operators = false,
--                 folds = true,
--             },
--             strikethrough = true,
--             invert_selection = false,
--             invert_signs = false,
--             invert_tabline = false,
--             invert_intend_guides = false,
--             inverse = true, -- invert background for search, diffs, statuslines and errors
--             contrast = "", -- can be "hard", "soft" or empty string
--             palette_overrides = {},
--             overrides = {
--                 SignColumn = { bg = "#ff9900" },
--                 ["@lsp.type.method"] = { bg = "#ff9900" },
--                 -- ["@comment.lua"] = { bg = "#000000" },
--             },
--             dim_inactive = false,
--             transparent_mode = true,
--         },
--     },
--     {
--         "LazyVim/LazyVim",
--         opts = {
--             colorscheme = "gruvbox",
--         },
--     },
-- }
-- }
-- return {
--     require("tokyonight").setup({
--         -- your configuration comes here
--         -- or leave it empty to use the default settings
--         style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--         light_style = "day", -- The theme is used when the background is set to light
--         transparent = true, -- Enable this to disable setting the background color
--         transparent_background = true,
--         terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
--         styles = {
--             -- Style to be applied to different syntax groups
--             -- Value is any valid attr-list value for `:help nvim_set_hl`
--             comments = { italic = true },
--             keywords = { italic = true },
--             functions = {bold = true},
--             variables = {},
--             -- Background styles. Can be "dark", "transparent" or "normal"
--             sidebars = "transparent", -- style for sidebars, see below
--             floats = "transparent", -- style for floating windows
--         },
--         sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
--         day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
--         hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
--         dim_inactive = false, -- dims inactive windows
--         lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
--
--         --- You can override specific color groups to use other groups or a hex color
--         --- function will be called with a ColorScheme table
--         ---@param colors ColorScheme
--         on_colors = function(colors) end,
--
--         --- You can override specific highlights to use other groups or a hex color
--         --- function will be called with a Highlights and ColorScheme table
--         ---@param highlights Highlights
--         ---@param colors ColorScheme
--         on_highlights = function(highlights, colors) end,
--     }),
-- }
