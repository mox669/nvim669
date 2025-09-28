local util = require('lspconfig.util')
local cmp_lsp = require('cmp_nvim_lsp')

local function create_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  vim.list_extend(
    capabilities.textDocument.completion.completionItem.resolveSupport.properties,
    {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  )
  return cmp_lsp.default_capabilities(capabilities)
end

util.on_setup = util.add_hook_after(util.on_setup, function(config)
  if config.on_attach then
    config.on_attach =
      util.add_hook_after(config.on_attach, require('mox.lsp.on_attach'))
  else
    config.on_attach = require('mox.lsp.on_attach')
  end
  config.capabilities = vim.tbl_deep_extend(
    'force',
    create_capabilities(),
    config.capabilities or {}
  )
end)

-- Language Server
-- For a list of supported server visit
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
require('mason-lspconfig').setup({
  -- configure, which server should be ensured to be installed
  ensure_installed = {
    'lua_ls',
    'clangd',
    'bashls',
    'yamlls',
    'gopls',
    'rust_analyzer',
    'taplo',
    'basedpyright',
  },
})

-- Linter
-- For a list of supported linters, visit
-- https://github.com/mfussenegger/nvim-lint
require('mason-nvim-lint').setup({
  -- configure, which server should be ensured to be installed
  ensure_installed = {
    'markdownlint',
  },
  automatic_installation = false,
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
vim.lsp.config('clangd', {
  cmd = {
    'clangd',
    '--offset-encoding=utf-8',
    '--clang-tidy',
    '--enable-config',
  },
})
vim.lsp.config('yamlls', {
  format = {
    enable = true,
  },
})
vim.lsp.config('gopls', {})
vim.lsp.config('bashls', {})
vim.lsp.config('taplo', {})
--   vim.lsp.config('tsserver', {})
vim.lsp.config('matlab_ls', {
  root_dir = function()
    return '/home/mox/.local/dev/mdtg/matlab'
  end,
  MATLAB = {
    installPath = '/home/mox/.local/share/matlab/bin',
    telemetry = false,
  },
})
vim.lsp.config('mesonlsp', {})
vim.lsp.config('cmake', {})
vim.lsp.config('basedpyright', {})
vim.lsp.config('vhdl_ls', {})
-- vim.lsp.config('markdown', {})

vim.lsp.enable(require('mason-lspconfig').get_installed_servers())
