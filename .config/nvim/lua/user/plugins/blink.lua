return {
  "saghen/blink.cmp",
  version = "1.*",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "L3MON4D3/LuaSnip",
  },
  opts = {
    snippets = { preset = "luasnip" },
    signature = { enabled = true },
    keymap = {
      -- ref: https://cmp.saghen.dev/configuration/keymap.html#super-tab
      preset = "super-tab",
      ["<CR>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
    },
    sources = {
      providers = {
        lsp = {
          -- ref: https://cmp.saghen.dev/recipes.html#exclude-keywords-constants-from-autocomplete
          transform_items = function(_, items)
            return vim.tbl_filter(function(item)
              return item.kind ~= require("blink.cmp.types").CompletionItemKind.Keyword
            end, items)
          end,
        },
        buffer = { max_items = 6 },
        snippets = { max_items = 6 },
        path = {
          opts = {
            -- ref: https://cmp.saghen.dev/recipes.html#path-completion-from-cwd-instead-of-current-buffer-s-directory
            get_cwd = function()
              return vim.fn.getcwd()
            end,
          },
        },
      },
    },
    completion = {
      list = {
        selection = { auto_insert = false },
      },
      trigger = { show_in_snippet = false },
      menu = {
        draw = {
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "source_name" },
          },
          components = {
            source_name = {
              text = function(ctx)
                return "[" .. ctx.source_name .. "]"
              end,
            },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
      },
    },
  },
}
