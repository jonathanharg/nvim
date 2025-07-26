return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  lazy = true,
  config = function()
    require('nvim-treesitter.configs').setup {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['a='] = { query = '@assignment.outer', desc = 'assignment' },
            ['i='] = { query = '@assignment.inner', desc = 'assignment' },
            ['l='] = { query = '@assignment.lhs', desc = 'assignment' },
            ['r='] = { query = '@assignment.rhs', desc = 'assignment' },

            ['aa'] = { query = '@parameter.outer', desc = 'argument' },
            ['ia'] = { query = '@parameter.inner', desc = 'argument' },

            ['ai'] = { query = '@conditional.outer', desc = 'conditional/if' },
            ['ii'] = { query = '@conditional.inner', desc = 'conditional/if' },

            ['al'] = { query = '@loop.outer', desc = 'loop' },
            ['il'] = { query = '@loop.inner', desc = 'loop' },

            ['af'] = { query = '@call.outer', desc = 'function call' },
            ['if'] = { query = '@call.inner', desc = 'function call' },

            ['am'] = { query = '@function.outer', desc = 'method definition' },
            ['im'] = { query = '@function.inner', desc = 'method definition' },

            -- ['ac'] = { query = '@class.outer', desc = 'class' },
            -- ['ic'] = { query = '@class.inner', desc = 'class' },
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']f'] = { query = '@call.outer', desc = 'function call' },
            [']m'] = { query = '@function.outer', desc = 'method definition' },
            -- [']c'] = { query = '@class.outer', desc = 'class' },
            [']i'] = { query = '@conditional.outer', desc = 'conditional/if' },
            [']l'] = { query = '@loop.outer', desc = 'loop' },

            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
            [']s'] = { query = '@scope', query_group = 'locals', desc = 'scope' },
            [']z'] = { query = '@fold', query_group = 'folds', desc = 'fold' },
          },
          goto_next_end = {
            [']F'] = { query = '@call.outer', desc = 'function call end' },
            [']M'] = { query = '@function.outer', desc = 'method definition end' },
            -- [']C'] = { query = '@class.outer', desc = 'class end' },
            [']I'] = { query = '@conditional.outer', desc = 'conditional/if end' },
            [']L'] = { query = '@loop.outer', desc = 'loop end' },
          },
          goto_previous_start = {
            ['[f'] = { query = '@call.outer', desc = 'function call' },
            ['[m'] = { query = '@function.outer', desc = 'method definition' },
            -- ['[c'] = { query = '@class.outer', desc = 'class' },
            ['[i'] = { query = '@conditional.outer', desc = 'conditional/if' },
            ['[l'] = { query = '@loop.outer', desc = 'loop' },
          },
          goto_previous_end = {
            ['[F'] = { query = '@call.outer', desc = 'funciton call end' },
            ['[M'] = { query = '@function.outer', desc = 'method definition end' },
            -- ['[C'] = { query = '@class.outer', desc = 'class end' },
            ['[I'] = { query = '@conditional.outer', desc = 'conditional/if end' },
            ['[L'] = { query = '@loop.outer', desc = 'loop end' },
          },
        },
      },
    }

    -- local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

    -- vim way: ; goes to the direction you were moving.
    -- vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
    -- vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    -- vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f)
    -- vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F)
    -- vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t)
    -- vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T)
  end,
}
