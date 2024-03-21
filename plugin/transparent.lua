require('transparent').setup({
  exclude_groups = {
    'SignColumn',
    'LineNr',
    'CursorLineNr',
    'CursorLine',
  },
})

vim.keymap.set(
  'n',
  '<Leader>tr',
  ':TransparentToggle<CR>',
  { noremap = true, silent = true }
)
