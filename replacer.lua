local function camelToSnake(str)
    return str:gsub("%u", "_%1"):lower()
end

local function snakeToCamel(str)
    return str:gsub("_(%w)", string.upper)
end

--[[
    @brief Replaces all identifiers in the file with the new identifiers (snake_case)
    @param Identifiers: table<Identifier>
    @param file: string
]] --
local function replacer(Identifiers, file, toSnake)
    if toSnake == nil then
        toSnake = true
    end

    local newFile = ""
    local previousEnd = 0
    local newIdentifier = ""
    for i = 1, #Identifiers, 1 do
        local identifier = Identifiers[i]
        local oldIdentifier = string.sub(file, identifier.index, identifier.index + identifier.length - 1)

        if toSnake then
            newIdentifier = camelToSnake(oldIdentifier)
        else
            newIdentifier = snakeToCamel(oldIdentifier)
        end

        newFile = newFile .. file:sub(previousEnd, identifier.index - 1) .. newIdentifier
        previousEnd = identifier.index + identifier.length
    end

    newFile = newFile .. file:sub(previousEnd, #file)
    return newFile
end


return replacer
