local t = require('transparent')
t.setup({
  exclude_groups = {
    'ToggleTerm1Normal',
    'SignColumn',
    'LineNr',
    'CursorLineNr',
    'NvimTree',
  },
})
