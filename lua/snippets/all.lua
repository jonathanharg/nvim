local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

-- From https://ejmastnak.com/tutorials/vim-latex/luasnip/
local get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    -- return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
    return sn(nil, t(parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

local fdate = function()
  return os.date '%d-%b-%y'
end

-- TODO: Autocomplete guard types? - Pull from file

return {
  s('fc', fmt('JIH {}: {}', { f(fdate), i(1) })),
  s('fcf', fmt('FERAL_COMMENT(/* JIH {}: {} */)', { f(fdate), i(1) })),

  -- FNC (Feral Guard No Comment)
  s(
    { trig = '^fnc', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    fmt(
      [[
      #if {}
      {}
      #endif // {}{}
      ]],
      {
        i(2),
        d(1, get_visual),
        rep(2),
        i(0),
      }
    )
  ),

  -- FG (Feral Guard) Highlight code, want to guard it if/endif
  s(
    { trig = '^fg', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
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

  -- FR (Feral Guard Up) Highlight code, want to replace it if(HIGHLIGHTED)/else/endif
  s(
    { trig = '^fr', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    fmt(
      [[
      #if {} // JIH {}: {}
      {}
      #elseif // {}
      {}
      #endif // {}
      ]],
      {
        i(2),
        f(fdate),
        i(3),
        i(0),
        rep(2),
        d(1, get_visual),
        rep(2),
      }
    )
  ),

  -- FV (Feral Guard Down) Highlight code, want to replace it if/else(HIGHLIGHTED)/endif
  s(
    { trig = '^fv', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    fmt(
      [[
      #if {} // JIH {}: {}
      {}
      #elseif // {}
      {}
      #endif // {}
      ]],
      {
        i(2),
        f(fdate),
        i(3),
        d(1, get_visual),
        rep(2),
        i(0),
        rep(2),
      }
    )
  ),
}
