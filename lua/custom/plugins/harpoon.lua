return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()
      vim.keymap.set('n', '<leader>ga', function() harpoon:list():add() end, { desc = 'Harpoon [A]dd' })
      vim.keymap.set('n', '<leader>gm', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon [M]enu' })
      -- Use with 'n<leader>hg'. E.g. '5<leader>hg' to go to buffer 5
      vim.keymap.set('n', '<leader>gg', function() harpoon:list():select(vim.v.count) end, { desc = 'Harpoon goto n' })
      vim.keymap.set('n', '<leader>u', function() harpoon:list():select(1) end, { desc = 'Harpoon to buffer 1' })
      vim.keymap.set('n', '<leader>i', function() harpoon:list():select(2) end, { desc = 'Harpoon to buffer 2' })
      vim.keymap.set('n', '<leader>o', function() harpoon:list():select(3) end, { desc = 'Harpoon to buffer 3' })
      vim.keymap.set('n', '<leader>p', function() harpoon:list():select(4) end, { desc = 'Harpoon to buffer 4' })
      vim.keymap.set('n', '<leader>gu', function() harpoon:list():replace_at(1) end, { desc = 'Harpoon [U]pdate buffer 1' })
      vim.keymap.set('n', '<leader>gi', function() harpoon:list():replace_at(2) end, { desc = 'Harpoon [U]pdate buffer 2' })
      vim.keymap.set('n', '<leader>go', function() harpoon:list():replace_at(3) end, { desc = 'Harpoon [U]pdate buffer 3' })
      vim.keymap.set('n', '<leader>gp', function() harpoon:list():replace_at(4) end, { desc = 'Harpoon [U]pdate buffer 4' })
    end,
  },
}
