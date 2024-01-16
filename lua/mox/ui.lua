vim.cmd([[
  function! Highlights() abort
      highlight NeoTreeNormal guibg=#0b0b0b
      highlight NeoTreeNormalNC guibg=#000000
      highlight NeoTreeWinSeparator guibg=#0b0b0b guifg=#0b0b0b
      highlight ToggleTerm1Normal guibg=#000000 guifg=#ffffff
      highlight TelescopeNormal guibg=#0b0b0b
      highlight TelescopeBorder guifg=#cccccc guibg=#444444
      highlight Visual guibg=#4567d6
      highlight CopilotSuggestion guifg=#555555 ctermfg=8
      highlight LazyGitFloat guibg=#0b0b0b
      highlight LazyGitBorder guibg=#444444
      " highlight MarkSignHL guibg=#0b0b0b guifg=#ffffff gui=bold
      " highlight SignColumn guibg=#0b0b0b
      " highlight LineNr guibg=#2a2a2d
      " highlight LineNr guibg=#1b1b1b
      " highlight CursorLineNr guibg=#2a2a2d
      " highlight CursorLineNr guibg=#1b1b1b
      " highlight GitSignsAdd guibg=#0b0b0b
      " highlight gitsignsChange guibg=#0b0b0b
      " highlight gitsignsDelete guibg=#0b0b0b
  endfunction

  augroup MoxHigh
    autocmd!
    au ColorScheme * call Highlights()
  augroup END

  " let g:mellow_transparent = 1

  set background=dark
  colorscheme mellow
]])
