function write_events (created_file, header, modulepath)
    created_file:write("local event = { \"" .. header.event[1] .. "\"") -- put values from yaml in lua form
    for _, yaml_event in ipairs(header.event) do
        if yaml_event ~= header.event[1] then
        created_file:write(', "' .. yaml_event .. '"') -- put all events to 'local event = { }'
        end
    end
    created_file:write(" }")
end

file_patcher.add_preprocessor(write_events, "actions")