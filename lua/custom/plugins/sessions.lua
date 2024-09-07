return {
  'folke/persistence.nvim',
  event = 'BufReadPre', -- this will only start session saving when an actual file was opened
  opts = {
    -- add any custom options here
  },
  keys = {
    {
      '<leader>Sr',
      function()
        require('persistence').load()
      end,
      desc = '[S]ession [r]estore',
    },
    {
      '<leader>Ss',
      function()
        require('persistence').select()
      end,
      desc = '[S]ession [s]elect',
    },
    {
      '<leader>Sl',
      function()
        require('persistence').load { last = true }
      end,
      desc = '[S]ession restore [l]ast',
    },
    {
      '<leader>Sd',
      function()
        require('persistence').stop()
      end,
      desc = "[S]ession [d]on't save",
    },
  },
}
