--------
-- rustaceanvim configuration
-- Source: https://github.com/mrcjkb/rustaceanvim
--------

return {
  'mrcjkb/rustaceanvim',
  config = function()
    vim.g.rustaceanvim = {
      server = {
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
