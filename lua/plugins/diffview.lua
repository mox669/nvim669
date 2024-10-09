--------
-- diffview configuration
-- Source: https://github.com/sindrets/diffview.nvim
--------

return {
  'sindrets/diffview.nvim',
  lazy = false,
  keys = {
    { '<Leader>df', '<CMD>DiffviewOpen<CR>' },
  },
  config = function()
    require('diffview').setup({
      view = {
        default = {
          layout = 'diff2_horizontal',
        },
      },
      file_panel = {
        listing_style = 'list',
        win_config = {
          width = 40,
        },
      },
    })
  end,
}
