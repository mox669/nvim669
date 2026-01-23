local hi = function(hl, opts)
  vim.api.nvim_set_hl(0, hl, opts)
end

local bg = '#0c0c0c'
local err = '#e5412b'
local warn = '#fc851e'

vim.opt.background = 'dark'
vim.cmd([[
    colorscheme biscuit

    " tmuxline configs
    let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '',
    \ 'right' : '',
    \ 'right_alt' : '',
    \ 'space' : ' '}
]])

-- Diagnostic
hi('DiagnosticSignError', { fg = err, bg = bg })
hi('DiagnosticVirtualTextError', { fg = err })
hi('DiagnosticVirtualLinesError', { fg = err })
hi('DiagnosticUnderlineError', { sp = err, undercurl = true })

hi('DiagnosticSignWarn', { fg = warn, bg = bg })
hi('DiagnosticVirtualTextWarn', { fg = warn })
hi('DiagnosticVirtualLinesWarn', { fg = warn })
hi('DiagnosticUnderlineWarn', { sp = warn, undercurl = true })

hi('DiagnosticSignHint', { bg = bg })
hi('DiagnosticSignInfo', { bg = bg })

-- Neovim
hi('SignColumn', { bg = bg })
hi('LineNr', { bg = bg })
hi('TabLine', { fg = '#725a5a', bg = '#444444' })
hi('TabLineSel', { fg = '#768f80', bg = '#444444' })
hi('TabLineFill', { fg = '#725a5a', bg = '#444444' })

-- GitSigns
hi('GitSignsAdd', { link = 'SignColumn' })
hi('GitSignsChange', { link = 'SignColumn' })
hi('GitSignsDelete', { link = 'SignColumn' })

-- Notify
hi('NotifyBackground', { bg = bg })

-- Neorg
hi('@neorg.tags.ranged_verbatim.code_block', {})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.HINT] = '󰌵',
      [vim.diagnostic.severity.INFO] = ' ',
    },
    linehl = {
      -- [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
      -- [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
      -- [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
      -- [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
    },
    numhl = {},
  },
  virtual_lines = false,
  virtual_text = true,
})
