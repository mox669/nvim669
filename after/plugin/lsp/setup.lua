local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return
end

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

require('mason-lspconfig').setup({
  -- configure, which server should be ensured to be installed
  ensure_installed = {
    'lua_ls',
    'clangd',
    -- 'bashls',
    'yamlls',
    'gopls',
    'rust_analyzer',
    'taplo',
    'basedpyright',
  },
})

require('mason-lspconfig').setup_handlers({
  -- configure your lsp servers here
  ['lua_ls'] = function()
    lspconfig.lua_ls.setup({
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
  end,
  ['clangd'] = function()
    lspconfig.clangd.setup({
      cmd = {
        'clangd',
        '--offset-encoding=utf-8',
      },
    })
  end,
  ['yamlls'] = function()
    lspconfig.yamlls.setup({
      format = {
        enable = true,
      },
    })
  end,
  ['gopls'] = function()
    lspconfig.gopls.setup({})
  end,
  ['bashls'] = function()
    lspconfig.bashls.setup({})
  end,
  ['taplo'] = function()
    lspconfig.taplo.setup({})
  end,
  -- ['tsserver'] = function()
  --   lspconfig.tsserver.setup({})
  -- end,
  ['matlab_ls'] = function()
    lspconfig.matlab_ls.setup({
      root_dir = function()
        return '/home/mox/.local/dev/mdtg/matlab'
      end,
      MATLAB = {
        installPath = '/home/mox/.local/share/matlab/bin',
        telemetry = false,
      },
    })
  end,
  ['mesonlsp'] = function()
    lspconfig.mesonlsp.setup({})
  end,
  ['cmake'] = function()
    lspconfig.cmake.setup({})
  end,
  ['basedpyright'] = function()
    lspconfig.basedpyright.setup({})
  end,
  ['vhdl_ls'] = function()
    lspconfig.vhdl_ls.setup({})
  end,
})
