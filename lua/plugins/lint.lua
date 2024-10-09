--------
-- nvim-lint configuration
-- Source: https://github.com/mfussenegger/nvim-lint
--------

return {
  {
    'mfussenegger/nvim-lint',
    lazy = false,
    config = function()
      require('lint').linters_by_ft = {
        cpp = { 'cpplint' },
      }

      -- vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      --   callback = function()
      --     require('lint').try_lint()
      --   end,
      -- })
    end,
  },
}
