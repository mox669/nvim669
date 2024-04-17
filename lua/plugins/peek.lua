return {
  'toppair/peek.nvim',
  event = { 'VeryLazy' },
  build = 'deno task --quiet build:fast',
  config = function()
    require('peek').setup({
      app = 'browser',
    })
    vim.api.nvim_create_user_command('Peek', function()
      local peek = require('peek')
      if peek.is_open() then
        peek.close()
      else
        peek.open()
      end
    end, {})
  end,
}
