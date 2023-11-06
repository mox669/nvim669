require('nvim-web-devicons').setup({
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
