vim.cmd([[
  function! Highlights() abort
      highlight @neorg.tags.ranged_verbatim.code_block guibg=#202020
      highlight DiagnosticSignError                    guibg=#181818 guifg=#e5412b
      highlight DiagnosticVirtualTextError                           guifg=#f92307 gui=bold
      highlight DiagnosticSignWarn                     guibg=#181818 guifg=#e59347
      highlight DiagnosticVirtualTextWarn                            guifg=#fc851e gui=bold
      highlight DiagnosticSignInfo                     guibg=#181818
      highlight DiagnosticSignHint                     guibg=#181818
      highlight link GitSignsAdd SignColumn
      highlight link GitSignsChange SignColumn
      highlight link GitSignsDelete SignColumn
      highlight NotifyBackground                       guibg=#0b0b0b
  endfunction

  augroup MoxHigh
    autocmd!
    au ColorScheme * call Highlights()
  augroup END
  set background=dark
      colorscheme biscuit
]])

vim.fn.sign_define(
  'DiagnosticSignError',
  { text = ' ', texthl = 'DiagnosticSignError' }
)
vim.fn.sign_define(
  'DiagnosticSignWarn',
  { text = ' ', texthl = 'DiagnosticSignWarn' }
)
vim.fn.sign_define(
  'DiagnosticSignInfo',
  { text = ' ', texthl = 'DiagnosticSignInfo' }
)
vim.fn.sign_define(
  'DiagnosticSignHint',
  { text = '󰌵', texthl = 'DiagnosticSignHint' }
)
