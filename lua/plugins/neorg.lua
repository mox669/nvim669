--------
-- Neorg configuration
-- Source: https://github.com/nvim-neorg/neorg
--------

return {
  'nvim-neorg/neorg',
  dependencies = { 'luarocks.nvim' },
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = '*',
  keys = {
    { '<Leader>9e', '<CMD>Neorg workspace ninee_ws<CR>' },
    { '<Leader>md', '<CMD>Neorg workspace mdtg_ws<CR>' },
    { '<Leader>nr', '<CMD>Neorg return<CR>' },
  },
  config = function()
    require('neorg').setup({
      load = {
        ['core.defaults'] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              ninee_ws = '~/.local/docs/9e',
              mdtg_ws = '~/.local/docs/mdtg',
            },
            index = 'index.norg',
          },
        },
        ['core.concealer'] = {
          config = {
            folds = true,
            icons = {
              code_block = {
                conceal = true,
                content_only = false,
              },
            },
          },
        },
        ['core.esupports.metagen'] = {
          config = { update_date = false },
        },
      },
    })
  end,
}
