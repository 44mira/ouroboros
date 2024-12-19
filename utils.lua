local M = {}

function M.display_tbl(tbl)
  local elems = '{'
  local flag = true
  for k, v in pairs(tbl) do
    if not flag then
      elems = elems .. ', '
    else
      flag = false
    end

    if type(v) == 'table' then
      v = M.display_tbl(v)
    end

    elems = elems .. ('"%s": %s'):format(k, v)
  end

  return elems .. '}'
end

return M
