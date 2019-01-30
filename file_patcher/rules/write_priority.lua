function file_patcher.write_priority (created_file, header, modulename, priority, modulepath)
  if priority > 100 then priority = 100 end

  created_file:write("local priority = " .. priority)
end

file_patcher.add_preprocessor(file_patcher.write_priority, "rules")