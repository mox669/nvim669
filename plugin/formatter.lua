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
    javascript = {
      require('formatter.filetypes.javascript').prettier,
    },
    typescript = {
      require('formatter.filetypes.typescript').prettier,
    },
    html = {
      require('formatter.filetypes.html').prettier,
    },
    scss = {
        function ()
            return {
                exe = "prettier"
            }
        end
    },
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
