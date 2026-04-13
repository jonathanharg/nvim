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

local function get_next_function_name()
	local buf = vim.api.nvim_get_current_buf()
	local row = vim.api.nvim_win_get_cursor(0)[1]
	local root = vim.treesitter.get_parser(buf):parse()[1]:root()

	local query = vim.treesitter.query.parse(
		"cpp",
		[[
		(function_declarator declarator: (identifier) @func)
		(function_declarator declarator: (qualified_identifier name: (identifier) @func))
		(function_declarator declarator: (qualified_identifier name:
			(template_function name: (identifier) @func)))
		]]
	)
	for id, node in query:iter_captures(root, buf, row, -1) do
		if query.captures[id] == "func" then
			return vim.treesitter.get_node_text(node, buf)
		end
	end
	return ""
end

ls.add_snippets("all", {
	s("fc", fmt("// JIH {}: {}", { f(fdate), i(1) })),
	s("fcf", fmt("FERAL_COMMENT(/* JIH {}: {} */)", { f(fdate), i(1) })),
	s("fs", t({ "", "", "", "", "" })),
	s(
		"fh",
		fmt(
			[[
				//==============================================================================
				//		{}{}
				//==============================================================================
			]],
			{ f(get_next_function_name), i(1) }
		)
	),
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
