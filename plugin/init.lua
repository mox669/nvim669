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

  -----
  -- UI
  use({
    'mox669/tmuxline.vim',
    branch = 'custom-seperator',
  })
  use('nvim-tree/nvim-web-devicons')
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  })
  use('xiyaowong/transparent.nvim')
  use('lukas-reineke/indent-blankline.nvim')
  use({
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup()
    end,
  })

  -- colorschemes
  -- use({ 'mox669/fogbell.vim', branch = 'mox' })
  use({ 'Biscuit-Colorscheme/nvim', branch = 'main' })

  ----------
  -- UTILITY
  use({
    'nvim-treesitter/nvim-treesitter',
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
  use('mbbill/undotree')

  use({
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
  })
  use('rcarriga/nvim-notify')
  use({
    'nvim-neorg/neorg',
    config = function()
      require('neorg').setup({
        load = {
          ['core.defaults'] = {},
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
          ['core.dirman'] = {
            config = {
              workspaces = {
                work = '~/.local/docs/9e',
                home = '~/.local/docs/private',
              },
            },
          },
        },
      })
      vim.keymap.set(
        'n',
        '<Leader>nw',
        ':Neorg workspace work<CR>:Neorg index<CR>',
        { noremap = true, silent = true }
      )
      vim.keymap.set(
        'n',
        '<Leader>nh',
        ':Neorg workspace home<CR>:Neorg index<CR>',
        { noremap = true, silent = true }
      )
      vim.keymap.set(
        'n',
        '<Leader>nc',
        ':Neorg return<CR>',
        { noremap = true, silent = true }
      )
    end,
    run = ':Neorg sync-parsers',
    requires = 'nvim-lua/plenary.nvim',
  }) -- end neorg
  use('davidgranstrom/nvim-markdown-preview')
  use({
    'github/copilot.vim',
    lazy = false,
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ''

      -- remap suggestion accept
      vim.keymap.set('i', '<M-;>', 'copilot#Accept("")', {
        silent = true,
        expr = true,
      })
    end,
  })
  use({
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup({
        default_file_explorer = false,
      })

      vim.keymap.set(
        'n',
        '-',
        '<CMD>Oil<CR>',
        { desc = 'Open parent directory' }
      )
      -- vim.keymap.set('n', '-', ':Oil --float <CR>', {
      --   silent = true,
      --   expr = true,
      -- })
    end,
  })

  ------
  -- GIT
  use('kdheepak/lazygit.nvim')
  use({ 'lewis6991/gitsigns.nvim' })
  use({ 'tpope/vim-fugitive' })

  ------
  -- LSP
  use({
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  })
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-nvim-lua')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-cmdline')
  use('L3MON4D3/LuaSnip')
  use('rafamadriz/friendly-snippets')
  use('saadparwaiz1/cmp_luasnip')
  use('p00f/clangd_extensions.nvim')
  use({
    'ray-x/go.nvim',
    config = function()
      require('go').setup()
    end,
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
