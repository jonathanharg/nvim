return {
  'nvim-treesitter/nvim-treesitter-context',
  event = 'VeryLazy',
  opts = function()
    local tsc = require 'treesitter-context'
    vim.keymap.set('n', 'grc', function()
      if tsc.enabled() then
        tsc.enable()
      else
        tsc.disable()
      end
    end, { desc = 'LSP: [C]ontext Toggle' })

    return { enabled = true, trim_scope = 'inner', max_lines = 3 }
  end,
}
