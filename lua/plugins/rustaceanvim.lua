return {
  'mrcjkb/rustaceanvim',
  config = function()
    local on_attach = require('mox.lsp.on_attach')

    vim.g.rustaceanvim = {
      server = {
        on_attach = on_attach,
        default_settings = {
          cargo = {
            allFeatures = true,
          },
          checkOnSave = {
            allTargets = false,
            extraArgs = { '--target', 'armv7a-none-eabi' },
          },
        },
      },
      tools = {
        executor = require('rustaceanvim.executors').vimux,
        reload_workspace_from_cargo_toml = true,
        float_win_config = {
          border = {
            { ' ', 'FloatBorder' },
            { ' ', 'FloatBorder' },
            { ' ', 'FloatBorder' },
            { ' ', 'FloatBorder' },
            { ' ', 'FloatBorder' },
            { ' ', 'FloatBorder' },
            { ' ', 'FloatBorder' },
            { ' ', 'FloatBorder' },
          },
        },
      },
    }
  end,
}
