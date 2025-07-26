return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      harpoon:setup()

      vim.keymap.set('n', '<leader>ha', function()
        harpoon:list():add()
      end, { desc = '[H]arpoon [A]dd' })
      vim.keymap.set('n', '<leader>hm', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = '[H]arpoon [M]enu' })

      -- Use with 'n<leader>hg'. E.g. '5<leader>hg' to go to buffer 5
      vim.keymap.set('n', '<leader>hh', function()
        harpoon:list():select(vim.v.count)
      end, { desc = '[H]arpoon goto n' })

      vim.keymap.set('n', '<leader>u', function()
        harpoon:list():select(1)
      end, { desc = '[H]arpoon to buffer 1' })
      vim.keymap.set('n', '<leader>i', function()
        harpoon:list():select(2)
      end, { desc = '[H]arpoon to buffer 2' })
      vim.keymap.set('n', '<leader>o', function()
        harpoon:list():select(3)
      end, { desc = '[H]arpoon to buffer 3' })
      vim.keymap.set('n', '<leader>p', function()
        harpoon:list():select(4)
      end, { desc = '[H]arpoon to buffer 4' })

      vim.keymap.set('n', '<leader>hu', function()
        harpoon:list():replace_at(1)
      end, { desc = '[H]arpoon [U]pdate buffer 1' })
      vim.keymap.set('n', '<leader>hi', function()
        harpoon:list():replace_at(2)
      end, { desc = '[H]arpoon [U]pdate buffer 2' })
      vim.keymap.set('n', '<leader>ho', function()
        harpoon:list():replace_at(3)
      end, { desc = '[H]arpoon [U]pdate buffer 3' })
      vim.keymap.set('n', '<leader>hp', function()
        harpoon:list():replace_at(4)
      end, { desc = '[H]arpoon [U]pdate buffer 4' })
    end,
  },
}
