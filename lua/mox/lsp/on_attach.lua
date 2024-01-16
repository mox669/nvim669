-- Setup for hover lsp handlers
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'solid',
})

---@param bufnr number
-- Setup default key mappings for LSP
local function buf_set_keymaps(bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

-- TODO  11/07/23 - 13:47: utility function, refactor this into utils.lua
--
-- @brief print content of a table
--
-- @param tbl  table to print content of
-- @param indent  indent level for print
local function tprint(tbl, indent)
  if not indent then
    indent = 0
  end
  local toprint = string.rep(' ', indent) .. '{\r\n'
  indent = indent + 2
  for k, v in pairs(tbl) do
    toprint = toprint .. string.rep(' ', indent)
    if type(k) == 'number' then
      toprint = toprint .. '[' .. k .. '] = '
    elseif type(k) == 'string' then
      toprint = toprint .. k .. '= '
    end
    if type(v) == 'number' then
      toprint = toprint .. v .. ',\r\n'
    elseif type(v) == 'string' then
      toprint = toprint .. '"' .. v .. '",\r\n'
    elseif type(v) == 'table' then
      toprint = toprint .. tprint(v, indent + 2) .. ',\r\n'
    else
      toprint = toprint .. '"' .. tostring(v) .. '",\r\n'
    end
  end
  toprint = toprint .. string.rep(' ', indent - 2) .. '}'
  return toprint
end

return function(client, bufnr)
  buf_set_keymaps(bufnr)
  if client.config.name == 'clangd' then
    require('clangd_extensions.inlay_hints').setup_autocmd()
    require('clangd_extensions.inlay_hints').set_inlay_hints()
  end
  require('lsp-format').on_attach(client)
  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
  end
end
