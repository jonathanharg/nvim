-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.

return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Next git change' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Previous git change' })

        -- Actions
        -- visual mode
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'stage git hunk' })
        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'reset git hunk' })
        -- normal mode
        map('n', '<leader>ghs', gitsigns.stage_hunk, { desc = 'git hunk stage' })
        map('n', '<leader>ghr', gitsigns.reset_hunk, { desc = 'git hunk reset' })
        map('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'git stage buffer' })
        map('n', '<leader>ghu', gitsigns.undo_stage_hunk, { desc = 'git hunk undo stage' })
        map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'git reset buffer' })
        map('n', '<leader>ghp', gitsigns.preview_hunk, { desc = 'git hunk preview' })
        map('n', '<leader>ghb', gitsigns.blame_line, { desc = 'git hunk blame' })
        map('n', '<leader>gd', gitsigns.diffthis, { desc = 'git diff (index)' })
        map('n', '<leader>gD', function()
          gitsigns.diffthis '@'
        end, { desc = 'git diff (last commit)' })
        -- Toggles
        map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = 'git blame toggle' })
        map('n', '<leader>gd', gitsigns.toggle_deleted, { desc = 'git deleted toggle' })
      end,
    },
  },
}
