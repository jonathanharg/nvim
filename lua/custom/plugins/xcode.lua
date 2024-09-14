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
      { '<leader>xb', x.build, desc = '[X]code [b]uild' },
      { '<leader>xr', x.build_and_run, desc = '[X]code build & [r]un' },
      { '<leader>xR', x.run, desc = '[X]code [R]un' },
      { '<leader>xo', x.open_in_xcode, desc = '[X]code [o]pen' },
      { '<leader>xl', x.toggle_logs, desc = '[X]code [l]ogs' },
      { '<leader>xp', x.show_picker, desc = '[X]code [p]icker' },
      { '<leader>xs', x.configure_project, desc = '[X]code [s]etup' },
    }
  end,
}
