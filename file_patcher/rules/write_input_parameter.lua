function file_patcher.write_input_parameter (created_file, header, modulename, priority, modulepath)
  created_file:write("\nlocal input_parameter = \"" .. header.input_parameter .. "\"")
end

file_patcher.add_preprocessor(file_patcher.write_input_parameter, "rules")