return {
  'nvim-neorg/neorg',
  dependencies = { 'luarocks.nvim' },
  -- lazy = true,
  filetypes = { 'norg' },
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
            icons = {
              code_block = {
                conceal = true,
                content_only = false,
              },
            },
          },
        },
      },
    })
  end,
}
