function file_patcher.patch(name, mode, pre_content_write, post_content_write)

  if mode == "theme" or mode == "themes" then
          
    for _, fn in ipairs(file_patcher.preprocessors.themes) do
      fn(name)
    end

    return
  end

  package.preload[name] = function(modulename)
    local created_file = io.open("module.lua", "w+")
    local modulepath = string.gsub(modulename, "%.", "/")
    local path = "/"
    local filename = string.gsub(path, "%?", modulepath)
    local file = io.open(filename, "rb")
    if file then
      
      if mode == "simple" then
        file_patcher.write_to_file(created_file, pre_content_write)
        file_patcher.rewrite_file_content(created_file, modulepath)
        file_patcher.write_to_file(created_file, post_content_write)

      elseif mode == "action" mode == "actions" then
        local header = file_patcher.extract_header(modulepath)
        for _, fn in ipairs(file_patcher.preprocessors.actions) do
          fn(created_file, header, modulepath)
        end

      elseif mode == "rule" or mode == "rules" then
        local header = file_patcher.extract_header(modulepath)
        local priority = header.priority or 1

        for _, fn in ipairs(file_patcher.preprocessors.rules) do
          fn(created_file, header, modulename, priority, modulepath)
        end

      end

      created_file:close()
      local to_compile = io.open("module.lua", "rb")
      return assert(load(assert(to_compile:read("*a")), modulepath))
    end
  end
  return require(name)
end
