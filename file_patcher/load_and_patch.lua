function file_patcher.load_and_patch(name, mode, pre_content_write, post_content_write)
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

      elseif mode == "action" then
        local header = file_patcher.extract_header(modulepath)
        for _, fn in ipairs() do
          fn(created_file, header, modulepath)
        end

      elseif mode == "rule" then
        -- loop over rule preprocessors
      end

      created_file:close()
      local to_compile = io.open("module.lua", "rb")
      return assert(load(assert(to_compile:read("*a")), modulepath))
    end
  end
  return require(name)
end
