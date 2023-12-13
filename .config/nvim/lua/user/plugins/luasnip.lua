return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    require("luasnip.loaders.from_vscode").lazy_load()
    ls.add_snippets("tex", {
      s("ps", {
        t({ "\\problem", "", "" }),
        i(1),
        t({ "", "\\psend", "\\solution", "\\psend" }),
      }),
    }, {
      key = "tex",
    })
  end,
}
