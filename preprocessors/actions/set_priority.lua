function set_priority (created_file, header, modulepath)
    created_file:write("\nlocal priority = " .. header.priority .. " \n\n")
end

file_patcher.add_preprocessor(set_priority, "actions")