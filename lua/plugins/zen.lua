return {
  'folke/zen-mode.nvim',
  opts = {
    window = {},
    plugins = {
      gitsigns = { enabled = true },
      tmuxline = { enabled = true },
      kitty = {
        enabled = true,
        font = '+6',
      },
    },
  },
  keys = {
    { '<leader>z', '<CMD>ZenMode<CR>' },
  },
}
