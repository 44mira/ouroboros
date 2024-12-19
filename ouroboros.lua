#!/usr/bin/env lua

local lexer = require('lexer')
local replacer = require('replacer')
local utils = require('utils')

if #arg < 1 then
  print("Please provide file to modify.")
  return 1
end

local to_snake = true
if #arg > 1 then
  for _, s in ipairs(arg) do
    if s:match('%-c') ~= nil then
      to_snake = false
    end
  end
end

-- read the contents
local filename = arg[1] or 'main.lua'
local filehandle = assert(io.open(filename, 'r'))
local content = filehandle:read('*a')
filehandle:close()

local tokens = lexer(content)
-- print(utils.display_tbl(tokens))
local replaced = replacer(tokens, content, to_snake)

print(replaced)
