return {
  'folke/persistence.nvim',
  event = 'BufReadPre', -- this will only start session saving when an actual file was opened
  opts = {
    -- add any custom options here
  },
  keys = {
    {
      '<leader>sr',
      function()
        require('persistence').load()
      end,
      desc = '[S]ession [R]estore',
    },
    {
      '<leader>ss',
      function()
        require('persistence').select()
      end,
      desc = '[S]ession [S]elect',
    },
    {
      '<leader>sl',
      function()
        require('persistence').load { last = true }
      end,
      desc = '[S]ession Restore [L]ast',
    },
    {
      '<leader>sd',
      function()
        require('persistence').stop()
      end,
      desc = "[S]ession [D]on't Save",
    },
  },
}
