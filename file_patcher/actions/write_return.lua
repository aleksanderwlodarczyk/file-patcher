function file_patcher.write_return (created_file, header, modulepath)
    created_file:write("\n\nreturn{\n\tevent = event,\n\taction = action,\n\tpriority = priority,\n\tinput_parameters = input_parameters\n}") -- ending return
end

file_patcher.add_preprocessor(file_patcher.write_return, "actions")