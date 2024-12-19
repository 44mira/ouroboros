local lexer = require('lexer')
local utils = require('utils')

-- if #arg < 1 then
--   print("Please provide file to modify.")
--   return 1
-- end

-- read the contents
local filename = arg[1] or 'main.lua'
local filehandle = assert(io.open(filename, 'r'))
local content = filehandle:read('*a')
filehandle:close()

local tokens = lexer(content)
--[[ this is where the replacer goes ]]
