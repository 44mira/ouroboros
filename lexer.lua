---@alias Identifier { index: integer, length: integer }

local keywords = {
  "and", "break", "do", "else", "elseif", "end",
  "false", "for", "function", "goto", "if",
  "in", "local", "nil", "not", "or", "repeat",
  "return", "then", "true", "until", "while",
  "%+", "%-", "%*", "/", "%%", "%^", "#",
  "==", "~=", "<", ">", "<=", ">=",
  "=",
  "%.%.",
  "%.", ":",
  "%[", "%]", "%{", "%}",
  "%(", "%)",
}

---@param tokens Identifier[]
---@param word string
---@param index integer
local function tokenize_word(tokens, word, index)
  local not_keyword = true

  for _, keyword in ipairs(keywords) do
    if word:match(keyword) ~= nil then
      not_keyword = false
      break
    end
  end

  if not_keyword then
    table.insert(tokens, { index = index, length = #word })
  end
end

---Takes in a string and returns its tokens with respect to Lua grammar.
---@param content string
---@return Identifier[]
local function tokenize(content)
  ---@type Identifier[]
  local tokens = {}

  local word = ''
  local index = 0
  for c in content:gmatch('.') do
    index = index + 1
    if c:match('%s') ~= nil then
      tokenize_word(tokens, word, index)
      word = ''
    else
      word = word .. c
    end
  end

  return tokens
end

return tokenize
