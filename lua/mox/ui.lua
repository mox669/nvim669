vim.cmd([[
  function! Highlights() abort
      highlight NeoTreeNormal guibg=#0b0b0b
      highlight NeoTreeNormalNC guibg=#0b0b0b
      highlight NeoTreeWinSeparator guibg=#0b0b0b guifg=#0b0b0b
      highlight ToggleTerm1Normal guibg=#000000 guifg=#ffffff
      highlight TelescopeNormal guibg=#0b0b0b
      highlight TelescopeBorder guibg=#0b0b0b guifg=#0b0b0b
      " highlight SignColumn guibg=#111111
      " highlight LineNr guibg=#222222
      " highlight CursorLineNr guibg=#222222
  endfunction

  augroup MoxHigh
    autocmd!
    au ColorScheme * call Highlights()
  augroup END

  " let g:mellow_transparent = 1

  set background=dark
  colorscheme mellow
]])
