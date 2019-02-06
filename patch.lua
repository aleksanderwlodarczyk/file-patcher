function file_patcher.patch(mode, ...)
          
    for _, fn in ipairs(file_patcher.preprocessors[mode]) do
      fn(...)
    end

end
