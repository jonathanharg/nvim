return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  lazy = true,
  opts = {
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
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

          ['ac'] = { query = '@class.outer', desc = 'class' },
          ['ic'] = { query = '@class.inner', desc = 'class' },

          ['ag'] = { query = '@feral', desc = 'feral guard' },
          -- ['ig'] = { query = '@feral.inner', desc = 'feral guard' },
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']f'] = { query = '@call.outer', desc = 'function call' },
          [']m'] = { query = '@function.outer', desc = 'method definition' },
          [']c'] = { query = '@class.outer', desc = 'class' },
          [']i'] = { query = '@conditional.outer', desc = 'conditional/if' },
          [']l'] = { query = '@loop.outer', desc = 'loop' },
          [']g'] = { query = '@feral', desc = 'feral guard' },

          -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
          -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
          [']s'] = { query = '@scope', query_group = 'locals', desc = 'scope' },
          [']z'] = { query = '@fold', query_group = 'folds', desc = 'fold' },
        },
        goto_next_end = {
          [']F'] = { query = '@call.outer', desc = 'function call end' },
          [']M'] = { query = '@function.outer', desc = 'method definition end' },
          [']C'] = { query = '@class.outer', desc = 'class end' },
          [']I'] = { query = '@conditional.outer', desc = 'conditional/if end' },
          [']L'] = { query = '@loop.outer', desc = 'loop end' },
          [']G'] = { query = '@feral', desc = 'feral guard' },
        },
        goto_previous_start = {
          ['[f'] = { query = '@call.outer', desc = 'function call' },
          ['[m'] = { query = '@function.outer', desc = 'method definition' },
          ['[c'] = { query = '@class.outer', desc = 'class' },
          ['[i'] = { query = '@conditional.outer', desc = 'conditional/if' },
          ['[l'] = { query = '@loop.outer', desc = 'loop' },
          ['[g'] = { query = '@feral', desc = 'feral guard' },
        },
        goto_previous_end = {
          ['[F'] = { query = '@call.outer', desc = 'funciton call end' },
          ['[M'] = { query = '@function.outer', desc = 'method definition end' },
          ['[C'] = { query = '@class.outer', desc = 'class end' },
          ['[I'] = { query = '@conditional.outer', desc = 'conditional/if end' },
          ['[L'] = { query = '@loop.outer', desc = 'loop end' },
          ['[G'] = { query = '@feral', desc = 'feral guard' },
        },
      },
    },
  },
}
