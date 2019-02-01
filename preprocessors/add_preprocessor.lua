function file_patcher.add_preprocessor(fn, mode)
  table.insert(file_patcher.preprocessors[mode], fn)
end