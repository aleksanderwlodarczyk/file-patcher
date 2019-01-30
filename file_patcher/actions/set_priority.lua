function file_patcher.set_priority (created_file, header, modulepath)
    created_file:write("\nlocal priority = " .. header.priority .. " \n\n")
end

file_patcher.add_preprocessor(file_patcher.set_priority, "actions")