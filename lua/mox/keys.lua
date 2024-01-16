-- Setup your key mappings inside this file

-- wrapper function
function map(mode, lhs, rhs, opts)
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- Leader
map('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- save and quit
map('n', '<Leader>w', ':w<CR>', { silent = true, noremap = true })
map('n', '<Leader>Q', ':q!<CR>', { silent = true, noremap = true })
map('n', '<Leader>q', ':BufDel<CR>', { silent = true, noremap = true })
map('n', '<Leader>s', '<cmd>so%<CR>', { silent = true, noremap = true })

-- basic window movement
map('n', '<C-h>', '<C-w>h', { silent = true })
map('n', '<C-j>', '<C-w>j', { silent = true })
map('n', '<C-k>', '<C-w>k', { silent = true })
map('n', '<C-l>', '<C-w>l', { silent = true })

-- indenting in visual mode
map('v', '<', '<gv', { noremap = true, silent = true })
map('v', '>', '>gv', { noremap = true, silent = true })

-- <ESC> alternative
map('i', 'jk', '<ESC>', { noremap = true, silent = true })
map('i', 'kj', '<ESC>', { noremap = true, silent = true })
map('i', 'KJ', '<ESC>', { noremap = true, silent = true })
map('i', 'JK', '<ESC>', { noremap = true, silent = true })

-- Tab switch buffer
map('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
map('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })

-- NeoTree explorer
map('n', '<Leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })

-- Telescope
map(
  'n',
  '<Leader>ps',
  ':lua require("telescope.builtin").grep_string({prompt_title = "Find string", grep_open_files = true})<CR>',
  { noremap = true, silent = true }
)

map(
  'n',
  '<Leader>pf',
  ':lua require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({}))<CR>',
  { noremap = true, silent = true }
)

map(
  'n',
  '<Leader>ph',
  ':lua require("telescope.builtin").help_tags()<CR>',
  { noremap = true, silent = true }
)
map(
  'n',
  '<Leader>pm',
  ':lua require("telescope.builtin").man_pages()<CR>',
  { noremap = true, silent = true }
)

-- Trouble
map('n', '<Leader>h', ':TroubleToggle<CR>', { noremap = true, silent = true })
-- Undotree
map('n', '<Leader>u', ':UndotreeToggle<CR>', { noremap = true, silent = true })
-- Neorg
map(
  'n',
  '<Leader>nw',
  ':Neorg workspace work<CR>:Neorg index<CR>',
  { noremap = true, silent = true }
)
map(
  'n',
  '<Leader>nh',
  ':Neorg workspace home<CR>:Neorg index<CR>',
  { noremap = true, silent = true }
)
map('n', '<Leader>nc', ':Neorg return<CR>', { noremap = true, silent = true })
map('n', '<Leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })
map('n', '<Leader>z', ':ZenMode<CR>', { noremap = true, silent = true })
map(
  'n',
  '<Leader>tr',
  ':TransparentToggle<CR>',
  { noremap = true, silent = true }
)

-- Lsp diagnostics
vim.keymap.set('n', '<space>di', vim.diagnostic.open_float)

-- Copilot remap
vim.keymap.set('i', '<M-;>', 'copilot#Accept("")', {
  silent = true,
  expr = true,
})
