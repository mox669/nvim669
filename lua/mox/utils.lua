-----------------------
-- Neovim/Lua utilities
-----------------------

local M = {}

-- @brief print content of a table
--
-- @param tbl  table to print content of
-- @param indent  indent level for print
function M.table_print(tbl, indent)
  if not indent then
    indent = 0
  end
  local to_print = string.rep(' ', indent) .. '{\r\n'
  indent = indent + 2
  for k, v in pairs(tbl) do
    to_print = to_print .. string.rep(' ', indent)
    if type(k) == 'number' then
      to_print = to_print .. '[' .. k .. '] = '
    elseif type(k) == 'string' then
      to_print = to_print .. k .. '= '
    end
    if type(v) == 'number' then
      to_print = to_print .. v .. ',\r\n'
    elseif type(v) == 'string' then
      to_print = to_print .. '"' .. v .. '",\r\n'
    elseif type(v) == 'table' then
      to_print = to_print .. M.table_print(v, indent + 2) .. ',\r\n'
    else
      to_print = to_print .. '"' .. tostring(v) .. '",\r\n'
    end
  end
  to_print = to_print .. string.rep(' ', indent - 2) .. '}'
  return to_print
end

return M
