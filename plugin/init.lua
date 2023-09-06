local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- Installation

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  print('Installing packer close and reopen Nvim ..')
  vim.cmd([[packadd packer.nvim]])
end

-- Sync

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]])

--------
-- Setup

return require('packer').startup(function()
  use('wbthomason/packer.nvim')

  -- UI
  use({
    'olekatpyle/tmuxline.vim',
    branch = 'custom-seperator',
  })
  use({
    'mcchrish/zenbones.nvim',
    requires = 'rktjmp/lush.nvim',
  })
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  })
  use({ 'lewis6991/gitsigns.nvim' })
  use('xiyaowong/transparent.nvim')

  --UTILITY
  use({
    'nvim-treesitter/nvim-treesitter',
    -- run = ':TSUpdate',
  })
  use({ 'ojroques/nvim-bufdel' })
  use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end,
  })
  use('mhartington/formatter.nvim')
  use({
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  })
  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    requires = { { 'nvim-lua/plenary.nvim' } },
  })
  use({
    'akinsho/toggleterm.nvim',
    tag = '*',
  })
  use({
    'folke/trouble.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opts = true },
    opts = {
      icons = false,
    },
  })
  use('mbbill/undotree')

  use({
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
  })

  --LSP
  use({
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  })
  use('hrsh7th/nvim-cmp') -- Autocompletion plugin
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-nvim-lua')
  use('hrsh7th/cmp-nvim-lsp') -- LSP source for nvim-cmp
  use('hrsh7th/cmp-cmdline')
  use('L3MON4D3/LuaSnip')
  use('rafamadriz/friendly-snippets')
  use('saadparwaiz1/cmp_luasnip')

  if packer_bootstrap then
    require('packer').sync()
  end
end)
