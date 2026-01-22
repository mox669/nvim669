require('mason-nvim-lint').setup({
  -- configure, which server should be ensured to be installed
  ensure_installed = {
    'markdownlint',
    'yamllint',
  },
  automatic_installation = false,
})

require('mason-lspconfig').setup({
  ensure_installed = {
    'basedpyright',
    'bashls',
    'jsonls',
    'ginko_ls',
    'gopls',
    'lua_ls',
    'rust_analyzer',
    'taplo',
    'yamlls',
  },

  automatic_enable = {
    'basedpyright',
    'bashls',
    'jsonls',
    'ginko_ls',
    'gopls',
    'rust_analyzer',
    'taplo',
  },
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      format = {
        enable = false,
      },
      hint = {
        enable = true,
        arrayIndex = 'Auto', -- "Enable", "Auto", "Disable"
        await = true,
        paramName = 'Literal', -- "All", "Literal", "Disable"
        paramType = true,
        semicolon = 'Disable', -- "All", "SameLine", "Disable"
        setType = true,
      },
      diagnostics = {
        globals = { 'P', 'vim', 'use' },
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.stdpath('config') .. '/lua'] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
vim.lsp.enable('lua_ls')

-- vim.lsp.config('clangd', {
--   cmd = {
--     'clangd',
--     '--offset-encoding=utf-8',
--   },
-- })
-- vim.lsp.enable('clangd')
vim.lsp.config('ccls', {
  init_options = {
    cache = { directory = '/home/mox/.cache/ccls' },
    compilationDatabaseDirectory = '.',
    clang = {
      extraArgs = { '-std=c++23' },
    },
    index = { threads = 4 },
  },
})
vim.lsp.enable('ccls')

vim.lsp.config('yamlls', {
  format = {
    enable = true,
  },
})
vim.lsp.enable('yamlls')
