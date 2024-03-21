-------
-- Undotree configuration
-- Source: https://github.com/mbbill/undotree
-------

vim.cmd([[
let g:loaded_undotree = 1   " Signal plugin availability with a value of 1.

"=================================================
"Options:

" Window layout
" style 1
" +----------+------------------------+
" |          |                        |
" |          |                        |
" | undotree |                        |
" |          |                        |
" |          |                        |
" +----------+                        |
" |          |                        |
" |   diff   |                        |
" |          |                        |
" +----------+------------------------+
" Style 2
" +----------+------------------------+
" |          |                        |
" |          |                        |
" | undotree |                        |
" |          |                        |
" |          |                        |
" +----------+------------------------+
" |                                   |
" |   diff                            |
" |                                   |
" +-----------------------------------+
" Style 3
" +------------------------+----------+
" |                        |          |
" |                        |          |
" |                        | undotree |
" |                        |          |
" |                        |          |
" |                        +----------+
" |                        |          |
" |                        |   diff   |
" |                        |          |
" +------------------------+----------+
" Style 4
" +-----------------------++----------+
" |                        |          |
" |                        |          |
" |                        | undotree |
" |                        |          |
" |                        |          |
" +------------------------+----------+
" |                                   |
" |                            diff   |
" |                                   |
" +-----------------------------------+
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 4
endif
]])

-- Key mappings
vim.keymap.set(
  'n',
  '<Leader>u',
  ':UndotreeToggle<CR>',
  { noremap = true, silent = true }
)
