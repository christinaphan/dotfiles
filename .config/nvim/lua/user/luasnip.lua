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
