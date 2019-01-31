function write_return (created_file, header, modulename, priority, modulepath)
  created_file:write("\nreturn{\n\trule = rule,\n\tpriority = priority,\n\tget_events_parameters = get_events_parameters\n}")
end

file_patcher.add_preprocessor(write_return, "rules")