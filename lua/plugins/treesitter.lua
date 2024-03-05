
return {
  "nvim-treesitter/nvim-treesitter",
  'nvim-treesitter/playground', 
  version = false, -- last release is way too old and doesn't work on Windows
  build = ":TSUpdate",
  event = { "LazyFile", "VeryLazy" },
  init = function(plugin)
    -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
    -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
    -- no longer trigger the **nvim-treeitter** module to be loaded in time.
    -- Luckily, the only thins that those plugins need are the custom queries, which we make available
    -- during startup.
    require("lazy.core.loader").add_to_rtp(plugin)
    require("nvim-treesitter.query_predicates")
  end,
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      config = function()
        -- When in diff mode, we want to use the default
        -- vim text objects c & C instead of the treesitter ones.
        local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
        local configs = require("nvim-treesitter.configs")
        for name, fn in pairs(move) do
          if name:find("goto") == 1 then
            move[name] = function(q, ...)
              if vim.wo.diff then
                local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
                for key, query in pairs(config or {}) do
                  if q == query and key:find("[%]%[][cC]") then
                    vim.cmd("normal! " .. key)
                    return
                  end
                end
              end
              return fn(q, ...)
            end
          end
        end
      end,
    },
  },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  keys = {
    { "<c-space>", desc = "Increment selection" },
    { "<bs>", desc = "Decrement selection", mode = "x" },
  },
  ---@type TSConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "diff",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "query",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
    textobjects = {
      move = {
        enable = true,
        goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
        goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
        goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
        goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
      },
    },
  },
  ---@param opts TSConfig
  config = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      ---@type table<string, boolean>
      local added = {}
      opts.ensure_installed = vim.tbl_filter(function(lang)
        if added[lang] then
          return false
        end
        added[lang] = true
        return true
      end, opts.ensure_installed)
    end
    require("nvim-treesitter.configs").setup(opts)
  end,
}
-- return {
-- 	{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
--
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		opts = {
-- 			ensure_installed = {
-- 				"css",
-- 				"gitignore",
-- 				"graphql",
-- 				"http",
-- 				"scss",
-- 				"sql",
--         "html",
--         "prisma",
--         "javascript",
--         "typescript",
--         "tsx",
-- 			},
--
-- 			-- matchup = {
-- 			-- 	enable = true,
-- 			-- },
--
-- 			-- https://github.com/nvim-treesitter/playground#query-linter
-- 			query_linter = {
-- 				enable = true,
-- 				use_virtual_text = true,
-- 				lint_events = { "BufWrite", "CursorHold" },
-- 			},
--
-- 			playground = {
-- 				enable = true,
-- 				disable = {},
-- 				updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
-- 				persist_queries = true, -- Whether the query persists across vim sessions
-- 				keybindings = {
-- 					toggle_query_editor = "o",
-- 					toggle_hl_groups = "i",
-- 					toggle_injected_languages = "t",
-- 					toggle_anonymous_nodes = "a",
-- 					toggle_language_display = "I",
-- 					focus_language = "f",
-- 					unfocus_language = "F",
-- 					update = "R",
-- 					goto_node = "<cr>",
-- 					show_help = "?",
-- 				},
-- 			},
-- 		},
-- 		config = function(_, opts)
-- 			require("nvim-treesitter.configs").setup(opts)
--
-- 			-- MDX
-- 			vim.filetype.add({
-- 				extension = {
-- 					mdx = "mdx",
-- 				},
-- 			})
-- 			vim.treesitter.language.register("markdown", "mdx")
-- 		end,
-- 	},
-- }
