return {
  -----
  -- UI
  {
    'mox669/tmuxline.vim',
    branch = 'custom-seperator',
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('ibl').setup({
        indent = { char = '▏' },
        scope = { enabled = false },
      })
    end,
  },
  {
    'j-hui/fidget.nvim',
    config = true,
  },

  -- colorschemes
  -- use({ 'mox669/fogbell.vim', branch = 'mox' })
  {
    'Biscuit-Colorscheme/nvim',
    branch = 'main',
  },

  ----------
  -- UTILITY
  {
    'ojroques/nvim-bufdel',
    config = function()
      require('bufdel').setup({
        quit = false,
      })
    end,
  },
  {
    'windwp/nvim-autopairs',
    config = true,
  },
  {
    'numToStr/Comment.nvim',
    config = true,
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup({
        stages = 'fade',
        timeout = 3000,
        fps = 60,
      })
    end,
  },
  {
    'github/copilot.vim',
    lazy = false,
    keys = {
      { '<M-;>', 'copilot#Accept("")', 'i', { silent = true, expr = true } },
    },
  },
  {
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
    end,
  },
  {
    'preservim/vimux',
    lazy = false,
    keys = {
      { '<Leader>tt', '<CMD>VimuxOpenRunner<CR>' },
      { '<Leader>vp', '<CMD>VimuxPromptCommand<CR>' },
    },
  },
  {
    'preservim/tagbar',
    config = function()
      vim.keymap.set(
        'n',
        '<Leader>t',
        '<CMD>TagbarToggle<CR>',
        { desc = 'Open / close tagbar (ctags)' }
      )
    end,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('harpoon').setup()
    end,
  },
  {
    'donRaphaco/neotex',
    file = { 'tex' },
  },

  ------
  -- GIT
  'tpope/vim-fugitive',

  ------
  -- LSP
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-cmdline',
  'rafamadriz/friendly-snippets',
  'saadparwaiz1/cmp_luasnip',
  'p00f/clangd_extensions.nvim',
  {
    'ray-x/go.nvim',
    config = true,
  },
  -- 'mrcjkb/rustaceanvim'
  'rust-lang/rust.vim',
  {
    'saecki/crates.nvim',
    tag = 'stable',
    config = function()
      local crates = require('crates')
      crates.setup()
      crates.show()
      vim.keymap.set(
        'n',
        '<Leader>uc',
        ":lua require('crates').update_all_crates()<CR>",
        { desc = 'Open / close tagbar (ctags)' }
      )
    end,
  },
  ------
  -- Deps
  'nvim-lua/plenary.nvim',
  {
    'vhyrro/luarocks.nvim',
    lazy = false,
    priority = 1000,
    config = true,
  },
} -- [[ end init.lua ]]
