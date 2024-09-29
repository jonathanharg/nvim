return {
  'wojciech-kulik/xcodebuild.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-tree.lua',
    'stevearc/oil.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {},
  keys = function()
    local x = require 'xcodebuild.actions'
    return {
      { '<leader>xb', x.build, desc = 'Build' },
      { '<leader>xr', x.build_and_run, desc = 'Build & Run' },
      { '<leader>xR', x.run, desc = 'Run' },
      {
        '<leader>xo',
        function()
          local file_path = vim.api.nvim_buf_get_name(0)
          local line_no = vim.api.nvim_win_get_cursor(0)[1]
          os.execute(
            'xed -p /Users/jhargreaves/Developer/gamedev/Feral/Development/Products/GridLegends/GridLegends.xcworkspace --line ' .. line_no .. ' ' .. file_path
          )
        end,
        desc = 'Open',
      },
      { '<leader>xl', x.toggle_logs, desc = 'Logs' },
      { '<leader>xp', x.show_picker, desc = 'Picker' },
      { '<leader>xs', x.configure_project, desc = 'Setup' },
    }
  end,
}
