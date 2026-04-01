local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local get_visual = function(_, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return sn(nil, t(parent.snippet.env.LS_SELECT_RAW))
	else
		return sn(nil, i(1))
	end
end

local fdate = function()
	return os.date("%d-%b-%y")
end

ls.add_snippets("all", {
	s("fc", fmt("JIH {}: {}", { f(fdate), i(1) })),
	s("fcf", fmt("FERAL_COMMENT(/* JIH {}: {} */)", { f(fdate), i(1) })),
	s("fs",  t({"","","","","",})),
	s("fh", fmt([[
				//====================
				//		{}
				//====================
				]], { i(1) })),
	s(
		"fg",
		fmt(
			[[
			#if {} // JIH {}: {}
			{}
			#endif // {}{}
			]],
			{
				i(2),
				f(fdate),
				i(3),
				d(1, get_visual),
				rep(2),
				i(0),
			}
		)
	),
})
