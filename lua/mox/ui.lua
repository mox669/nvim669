-- vim.cmd([[
--   function! Highlights() abort
--       highlight NeoTreeNormal guibg=#0b0b0b
--       highlight NeoTreeNormalNC guibg=#0b0b0b
--       highlight NeoTreeWinSeparator guibg=#0b0b0b guifg=#0b0b0b
--       highlight ToggleTerm1Normal guibg=#000000 guifg=#ffffff
--       highlight TelescopeNormal guibg=#0b0b0b
--       highlight TelescopeBorder guifg=#cccccc guibg=#444444
--       highlight Visual guibg=#4567d6
--       highlight CopilotSuggestion guifg=#555555 ctermfg=8
--       highlight LazyGitFloat guibg=#0b0b0b
--       highlight LazyGitBorder guibg=#444444
--       highlight MarkSignHL guibg=#0b0b0b guifg=#ffffff gui=bold
--       highlight ColorColumn guibg=#2a2a2a
--       highlight SignColumn guibg=#0f0f0f
--       highlight CursorLine guibg=#222222
--       highlight CursorLineNr guibg=#1b1b1b
--       highlight GitSignsAdd guibg=#0f0f0f
--       highlight GitSignsChange guibg=#0f0f0f
--       highlight GitSignsDelete guibg=#0f0f0f
--       highlight DiagnosticSignError guibg=#0f0f0f
--       highlight DiagnosticSignWarn guibg=#0f0f0f
--       highlight DiagnosticSignInfo guibg=#0f0f0f
--       highlight DiagnosticSignHint guibg=#0f0f0f
--       highlight Comment guifg=#787878
--
--   endfunction
--
--   augroup MoxHigh
--     autocmd!
--     au ColorScheme * call Highlights()
--   augroup END
--
--   set background=dark
--   " colorscheme fogbell
--   colorscheme biscuit
-- ]])

vim.cmd([[
  function! Highlights() abort
      highlight DiagnosticSignError                    guifg=#e5412b guibg=#0c0c0c
      highlight DiagnosticVirtualTextError             guifg=#f92307
      highlight DiagnosticVirtualLinesError            guifg=#f92307 guibg=#0c0c0c
      highlight DiagnosticUnderlineError               guifg=#f92307 guibg=#0c0c0c gui=undercurl
      highlight DiagnosticSignWarn                     guifg=#e59347 guibg=#0c0c0c
      highlight DiagnosticVirtualTextWarn              guifg=#fc851e
      highlight DiagnosticVirtualLinesWarn             guifg=#fc851e guibg=#0c0c0c
      highlight DiagnosticUnderlineWarn                guifg=#fc851e guibg=#0c0c0c gui=undercurl
      highlight DiagnosticSignInfo                                   guibg=#0c0c0c
      highlight DiagnosticSignHint                                   guibg=#0c0c0c
      highlight SignColumn                                           guibg=#0c0c0c
      highlight LineNr                                               guibg=#0c0c0c
      highlight link GitSignsAdd SignColumn
      highlight link GitSignsChange SignColumn
      highlight link GitSignsDelete SignColumn
      highlight NotifyBackground                                     guibg=#0b0b0b
      highlight @neorg.tags.ranged_verbatim.code_block               guibg=#202020
      highlight TabLine                                guifg=#725a5a guibg=#444444
      highlight TabLineSel                             guifg=#768f80 guibg=#444444
      highlight TabLineFill                            guifg=#725a5a guibg=#444444
  endfunction

  augroup MoxHigh
    autocmd!
    au ColorScheme * call Highlights()
  augroup END
  set background=dark
      colorscheme biscuit
]])

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.HINT] = '󰌵',
      [vim.diagnostic.severity.INFO] = ' ',
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
      [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
      [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
      [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
    },
    numhl = {},
  },
  virtual_lines = false,
  virtual_text = true,
})
