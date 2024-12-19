local function camel_to_snake(str)
  return str:gsub("%u", "_%1"):lower()
end

local function snake_to_camel(str)
  return str:gsub("_(%w)", string.upper)
end

---Replaces all identifiers in the file with the new identifiers (snake_case)
---@param identifiers Identifier[]
---@param file string
---@return string
local function replacer(identifiers, file, to_snake)
  if to_snake == nil then
    to_snake = true
  end

  local new_file = ""
  local previous_end = 0
  local new_identifier = ""
  for i = 1, #identifiers, 1 do
    local identifier = identifiers[i]
    local old_identifier = string.sub(file, identifier.index, identifier.index + identifier.length - 1)

    if to_snake then
      new_identifier = camel_to_snake(old_identifier)
    else
      new_identifier = snake_to_camel(old_identifier)
    end

    new_file = new_file .. file:sub(previous_end, identifier.index - 1) .. new_identifier
    previous_end = identifier.index + identifier.length
  end

  new_file = new_file .. file:sub(previous_end, #file)
  return new_file
end

return replacer
