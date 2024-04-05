--------
-- nvim-devicons configuration
-- Source: https://github.com/nvim-tree/nvim-web-devicons
--------

return {
  'nvim-tree/nvim-web-devicons',
  config = function()
    require('nvim-web-devicons').setup({
      color_icons = false,
      strinct = true,
      override_by_extension = {
        norg = {
          icon = '󱇧',
          color = '#1f98e2',
          name = 'Neorg',
        },
        bb = {
          icon = '󰯮',
          color = '#44d677',
          name = 'BitBake',
        },
        patch = {
          icon = '󰶯',
          color = '#f49e89',
          name = 'Patch',
        },
        diff = {
          icon = '',
          color = '#4ddb3b',
          name = 'Diff',
        },
      },
    })
  end,
}
