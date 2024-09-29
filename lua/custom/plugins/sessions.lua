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
      desc = 'Restore',
    },
    {
      '<leader>ss',
      function()
        require('persistence').select()
      end,
      desc = 'Select',
    },
    {
      '<leader>sl',
      function()
        require('persistence').load { last = true }
      end,
      desc = 'Restore Last',
    },
    {
      '<leader>sd',
      function()
        require('persistence').stop()
      end,
      desc = "Don't Save",
    },
  },
}
