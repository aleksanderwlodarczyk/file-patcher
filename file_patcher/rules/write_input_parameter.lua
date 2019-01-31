function write_input_parameter (created_file, header, modulename, priority, modulepath)
  created_file:write("\nlocal input_parameter = \"" .. header.input_parameter .. "\"")
end

file_patcher.add_preprocessor(write_input_parameter, "rules")