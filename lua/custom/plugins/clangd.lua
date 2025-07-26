return {
  'p00f/clangd_extensions.nvim',
  lazy = true,
  opts = {
    ast = {
      role_icons = {
        type = '',
        declaration = '',
        expression = '',
        specifier = '',
        statement = '',
        ['template argument'] = '',
      },

      kind_icons = {
        Compound = '',
        Recovery = '',
        TranslationUnit = '',
        PackExpansion = '',
        TemplateTypeParm = '',
        TemplateTemplateParm = '',
        TemplateParamObject = '',
      },

      highlights = {
        detail = 'Comment',
      },
    },
  },
  keys = {
    { 'gh', '<cmd>ClangdSwitchSourceHeader<cr>', desc = 'Header' },
  },
}
