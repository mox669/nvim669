local util = require('formatter.util')

require('formatter').setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    lua = {
      require('formatter.filetypes.lua').stylua,
    },
    c = {
      require('formatter.filetypes.c').clangformat,
    },
    cpp = {
      require('formatter.filetypes.cpp').clangformat,
    },
    javascript = {
      require('formatter.filetypes.javascript').prettier,
    },
    typescript = {
      require('formatter.filetypes.typescript').prettier,
    },
    yaml = {
      require('formatter.filetypes.yaml').yamlls,
    },
    html = {
      require('formatter.filetypes.html').prettier,
    },
    python = {
      require('formatter.filetypes.python').autopep8,
    },
    -- go = {
    --   require('formatter.filetypes.go').gofmt,
    -- },
    ['*'] = {
      require('formatter.filetypes.any').remove_trailing_whitespace,
    },
  },
})

vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
]])
