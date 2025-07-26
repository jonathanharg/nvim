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
        end, { desc = 'git [s]tage hunk' })
        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'git [r]eset hunk' })
        -- normal mode
        map('n', '<leader>ghs', gitsigns.stage_hunk, { desc = '[G]it [H]unk stage' })
        map('n', '<leader>ghr', gitsigns.reset_hunk, { desc = '[G]it [H]unk [R]eset' })
        map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[G]it [S]tage buffer' })
        map('n', '<leader>ghu', gitsigns.stage_hunk, { desc = '[G]it [H]unk [U]ndo stage' })
        map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[G]it [R]eset buffer' })
        map('n', '<leader>ghp', gitsigns.preview_hunk, { desc = '[G]it [H]unk [P]review' })
        map('n', '<leader>ghb', gitsigns.blame_line, { desc = '[G]it [H]unk [B]lame' })
        -- map('n', '<leader>gd', gitsigns.diffthis, { desc = '[G]it [D]iff (index)' })
        map('n', '<leader>gD', function()
          gitsigns.diffthis '@'
        end, { desc = '[G]it [D]iff (last commit)' })
        -- Toggles
        map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = '[G]it [B]lame toggle' })
        map('n', '<leader>gd', gitsigns.preview_hunk_inline, { desc = '[G]it [D]eleted toggle' })
      end,
    },
  },
}
